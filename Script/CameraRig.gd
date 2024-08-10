extends Node3D

# Control variables
@export var maxPitchDeg : float = 45
@export var minPitchDeg : float = -45
@export var maxZoom : float = 20
@export var minZoom : float = 4
@export var zoomStep : float = 2
@export var zoomYStep : float = 0.15
@export var verticalSensitivity : float = 0.002
@export var horizontalSensitivity : float = 0.002
@export var camYOffset : float = 4.0
@export var camLerpSpeed : float = 16.0
@export var _camTarget:NodePath

# Private variables
@onready var _springArm = $SpringArm
@onready var _curZoom : float = maxZoom

var _curYoffset : float = camYOffset
var a
func _ready() -> void:
	# make sure rig transform is independant
	a = get_node(_camTarget) as RigidBody3D
	set_as_top_level(true)

func _input(event) -> void:
	if event is InputEventMouseMotion:
		# Rotate the rig around the target using mouse
		rotation.y -= event.relative.x * horizontalSensitivity
		rotation.y = wrapf(rotation.y,0.0,TAU)
		
		rotation.x -= event.relative.y * verticalSensitivity
		rotation.x = clamp(rotation.x, deg_to_rad(minPitchDeg), deg_to_rad(maxPitchDeg))
		
	if event is InputEventMouseButton:
		# Change zoom level on mouse wheel rotation
		if event.is_pressed():
			if event.button_index == MOUSE_BUTTON_WHEEL_UP and _curZoom > minZoom:
				_curZoom -= zoomStep
				camYOffset -= zoomYStep
			if event.button_index == MOUSE_BUTTON_WHEEL_DOWN and _curZoom < maxZoom:
				_curZoom += zoomStep
				camYOffset += zoomYStep

func _physics_process(delta) -> void:
	# zoom the camera accordingly
	_springArm.spring_length = lerp(_springArm.spring_length, _curZoom, delta * camLerpSpeed)
	
	# set the position of the rig to follow the target
	_curYoffset = lerp(_curYoffset, camYOffset, delta * camLerpSpeed)
	set_position(a.global_transform.origin + Vector3(0,_curYoffset,0))
	


extends VehicleBody3D
class_name MonterBaseCar

@export var STEER_SPEED = 1.5
@export var STEER_LIMIT = 0.6
var steer_target = 0
@export var engine_force_value = 40


@export var FrontLeftWheel: VehicleWheel3D
@export var FrontRightWheel: VehicleWheel3D
@export var BackLeftWheel: VehicleWheel3D
@export var BackRightWheel: VehicleWheel3D


@export var SlowSteerMinSpeed = 27
 
@export var Skeleton3d: Skeleton3D

@export var BackRightMarker: Marker3D
@export var BackLeftMarker: Marker3D
@export var FrontLeftMarker: Marker3D
@export var FrontRightMarker: Marker3D

var fwd_mps : float
var speed: float


func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _physics_process(delta):
	speed = linear_velocity.length()* 30 *delta
	
	fwd_mps = transform.basis.x.x
	traction(speed)
	process_accel(delta)
	process_steer(delta)
	process_brake(delta)
	suspense()



func process_accel(delta):		
	if linear_velocity.length() < SlowSteerMinSpeed:
		STEER_SPEED = 1.5
		STEER_LIMIT = 0.6
	else:
		STEER_SPEED = 1
		STEER_LIMIT = 0.033
		
	if Input.is_action_pressed("Brakes"):
		if fwd_mps >= -1:
			if speed < 20 and speed != 0:
				engine_force = clamp(engine_force_value * 3 / speed, 0, 300)
			else:
				engine_force = engine_force_value

		return
	
	if Input.is_action_pressed("Throttle"):
		if speed < 30 and speed != 0:
			engine_force = -clamp(engine_force_value * 10 / speed, 0, 300)
		else:
			engine_force = -engine_force_value
		return
	
	engine_force = 0
	brake = 0

func process_steer(delta):
	
	steer_target = Input.get_action_strength("Steer Left") - Input.get_action_strength("Steer Right")
	steer_target *= STEER_LIMIT
	steering = move_toward(steering, steer_target, STEER_SPEED * delta)


func process_brake(delta):
	if Input.is_action_pressed("ui_select"):
		brake=0.5
		BackLeftWheel.wheel_friction_slip=2
		BackRightWheel.wheel_friction_slip=2
	else:
		BackLeftWheel.wheel_friction_slip=2.9
		BackRightWheel.wheel_friction_slip=2.9


func traction(speed):
	apply_central_force(Vector3.DOWN*speed)
	
	

func suspense():
	
	var head_index = Skeleton3d.find_bone("frontright")
	var head_marker = FrontRightMarker
	head_marker.look_at(FrontLeftWheel.get_child(0).global_position, Vector3.UP, true)
	head_marker.rotation_degrees.x += 90
	head_marker.rotation_degrees.y = 0
	head_marker.rotation_degrees.z = 0
	var new_rot = head_marker.transform.basis.get_rotation_quaternion()
	Skeleton3d.set_bone_pose_rotation(head_index, new_rot)
	
	var head_index2 = Skeleton3d.find_bone("backright")
	var headmarkers2 = BackRightMarker
	headmarkers2.look_at(BackRightWheel.get_child(0).global_position, Vector3.UP, true)
	headmarkers2.rotation_degrees.x += 90
	headmarkers2.rotation_degrees.y = 0
	headmarkers2.rotation_degrees.z = 0
	var new_rots2 = headmarkers2.transform.basis.get_rotation_quaternion()
	Skeleton3d.set_bone_pose_rotation(head_index2, new_rots2)
	
	var head_index3 = Skeleton3d.find_bone("backleft")
	var headmarkers3 = BackLeftMarker
	headmarkers3.look_at(BackLeftWheel.get_child(0).global_position, Vector3.UP, true)
	headmarkers3.rotation_degrees.x += 90
	headmarkers3.rotation_degrees.y = 180
	headmarkers3.rotation_degrees.z = 0
	var new_rots3 = headmarkers3.transform.basis.get_rotation_quaternion()
	Skeleton3d.set_bone_pose_rotation(head_index3, new_rots3)
	
	var head_index1 = Skeleton3d.find_bone("frontleft")
	var head_markers = FrontLeftMarker
	head_markers.look_at(FrontRightWheel.get_child(0).global_position, Vector3.UP, true)
	head_markers.rotation_degrees.x += 90
	head_markers.rotation_degrees.y = 180
	head_markers.rotation_degrees.z = 0
	var new_rots = head_markers.transform.basis.get_rotation_quaternion()
	Skeleton3d.set_bone_pose_rotation(head_index1, new_rots)

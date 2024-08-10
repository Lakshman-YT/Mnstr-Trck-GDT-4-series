
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
@export_range(0, 250) var rotation_speed: float = 130.0
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
	process_accel()
	process_steer(delta)
	process_brake()
	suspense()
	flip()

func process_accel():
	Skeleton3d.get_child(0).mesh.surface_get_material(1).emission_energy_multiplier = 1
	if linear_velocity.length() < SlowSteerMinSpeed:
		STEER_SPEED = 1.5
		STEER_LIMIT = 0.6
	else:
		STEER_SPEED = 1
		STEER_LIMIT = 0.033
		
	if Input.is_action_pressed("Brakes"):
		Skeleton3d.get_child(0).mesh.surface_get_material(1).emission_energy_multiplier = 10
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

func process_brake():
	if Input.is_action_pressed("ui_select"):
		brake=0.5
		BackLeftWheel.wheel_friction_slip=2
		BackRightWheel.wheel_friction_slip=2
	else:
		BackLeftWheel.wheel_friction_slip=2.9
		BackRightWheel.wheel_friction_slip=2.9

func traction(speed):
	apply_central_force(Vector3.DOWN*speed)

func flip():
	var rotation_amount = 0
	if Input.is_action_pressed("rotateup"):
		rotation_amount = -rotation_speed
	elif Input.is_action_pressed("rotatedown"):
		rotation_amount = rotation_speed

	if rotation_amount != 0:
		var rotation_vec = global_transform.basis.x * rotation_amount
		apply_torque(rotation_vec)

func suspense():
	update_bone_pose("frontright", FrontRightMarker, FrontLeftWheel)
	update_bone_pose("backright", BackRightMarker, BackRightWheel)
	update_bone_pose("backleft", BackLeftMarker, BackLeftWheel, 180)
	update_bone_pose("frontleft", FrontLeftMarker, FrontRightWheel, 180)

func update_bone_pose(bone_name, marker, target_wheel, y_rotation=0):
	var bone_index = Skeleton3d.find_bone(bone_name)
	marker.look_at(target_wheel.get_child(0).global_position, Vector3.DOWN, true)
	marker.rotation_degrees = Vector3(marker.rotation_degrees.x + 90 + y_rotation, y_rotation, y_rotation)
	var new_rotation = marker.transform.basis.get_rotation_quaternion()
	Skeleton3d.set_bone_pose_rotation(bone_index, new_rotation)
	

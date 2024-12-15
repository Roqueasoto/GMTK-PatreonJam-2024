extends Node2D



var reel_speed = 500
var fishing_line_angle = 0

@onready var boat:Area2D = $Boat
@onready var hook:RigidBody2D = $Hook
@onready var fishing_line:Line2D = %FishingLine



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass



func _handle_reel_input(delta: float) -> void:
	var reel_velocity = Vector2.ZERO # The player's movement vector.
	var reel_direction = Vector2(cos(fishing_line_angle), sin(fishing_line_angle))
	
	#if Input.is_action_pressed("Reel out"):
		#reel_velocity += reel_speed * reel_direction
	if Input.is_action_pressed("Reel in"):
		hook.apply_impulse(-reel_direction,Vector2(0,0))

	
	
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	_handle_reel_input(delta)
	
	
	hook.apply_central_force(-hook.linear_velocity/10)
	#hook	.apply_torque(-500*hook.angular_velocity)
	
	
	fishing_line.points = [
		boat.position,
		Vector2(hook.position[0], hook.position[1]+27)
	]
	
	var fishing_line_disp = (fishing_line.points[1] - fishing_line.points[0]).normalized()
	fishing_line_angle = atan2(fishing_line_disp[1], fishing_line_disp[0])
	
	#var reel_direction = Vector2(cos(fishing_line_angle)/sin(fishing_line_angle)*.015*9.8,.015*9.8 )
	
	#hook.apply_impulse(-reel_direction,Vector2(0,0))

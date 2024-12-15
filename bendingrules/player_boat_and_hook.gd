extends Node2D

@onready var boat:Area2D = $Boat
@onready var hook:RigidBody2D = $Hook
@onready var fishing_line:Line2D = %FishingLine

var fishing_line_angle = 0

func _handle_reel_input() -> void:
	var reel_direction = Vector2(cos(fishing_line_angle), sin(fishing_line_angle))
	
	if Input.is_action_pressed("Reel in"):
		hook.apply_impulse(-reel_direction,Vector2(0,0))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	_handle_reel_input()
	
	hook.apply_central_force(-hook.linear_velocity/20)
	fishing_line.points = [
		boat.position,
		Vector2(hook.position[0], hook.position[1]+27)
	]
	
	var fishing_line_disp = (fishing_line.points[1] - fishing_line.points[0]).normalized()
	fishing_line_angle = atan2(fishing_line_disp[1], fishing_line_disp[0])
	
func _input(_event):
	if Input.is_key_pressed(KEY_R):
		get_tree().reload_current_scene()

extends Node2D

# Nodes
var boat
var hook
var fishing_line

# Variables
var screen_size
var boat_speed = 500
var reel_speed = 500
var fishing_line_angle = 0


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	screen_size = get_viewport_rect().size
	boat = get_node('%Boat')
	hook = get_node('%Hook')
	fishing_line = get_node('%FishingLine')

func _handle_boat_input(delta: float) -> void:
	var boat_velocity = Vector2.ZERO # The player's movement vector.
	if Input.is_action_pressed("Boat left"):
		boat_velocity.x -= boat_speed
	if Input.is_action_pressed("Boat right"):
		boat_velocity.x += boat_speed
		
	boat.position += boat_velocity * delta
	#boat.position = position.clamp(Vector2.ZERO, screen_size)
	
	#print(boat.position, boat_velocity, boat_velocity * delta)

	var boat_sprite = boat.get_child(0)
	if boat_velocity.length() > 0:
		boat_sprite.animation = "row"
		boat_sprite.play()
	else:
		boat_sprite.stop()

func _handle_reel_input(delta: float) -> void:
	var reel_velocity = Vector2.ZERO # The player's movement vector.
	var reel_direction = Vector2(cos(fishing_line_angle), sin(fishing_line_angle))
	
	#if Input.is_action_pressed("Reel out"):
		#reel_velocity += reel_speed * reel_direction
	if Input.is_action_pressed("Reel in"):
		reel_velocity -= reel_speed * reel_direction
	
	
	hook.position += reel_velocity * delta
	hook.position[1] = max(15, hook.position[1])
	hook.position[1] +=1.2
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	_handle_boat_input(delta)
	_handle_reel_input(delta)
	
	fishing_line.points = [
		boat.position,
		Vector2(hook.position[0], hook.position[1]+27)
	]
	
	var fishing_line_disp = (fishing_line.points[1] - fishing_line.points[0]).normalized()
	fishing_line_angle = atan2(fishing_line_disp[1], fishing_line_disp[0])

	var perp = Vector2(fishing_line_disp[1],-fishing_line_disp[0])
	if perp[1]>0:
		perp = -perp
	if abs(fishing_line_angle-PI/2)>.01:
		hook.position-=2*perp*fishing_line_disp.length()
	#fishing_line_angle = atan2(fishing_line_disp[1], fishing_line_disp[0])
	
	hook.rotation = fishing_line_angle - PI/2
	
	#var boat_collision = boat.get_child(1)	
	#var hook_collision = hook.get_child(1)
	#
	#var boat_pos = boat.position
	#var hook_poly = hook_collision.polygon
	#
	#var boat_line_anchor = Vector2(boat_rect.position[0] + boat_rect.size[0]/2, boat_rect.position[1])
	#var hook_line_anchor = (hook_poly[2] + hook_poly[34])/2
	#
	#points = [boat_line_anchor, hook_line_anchor]
	
	if Input.is_action_pressed("Debug print"):
		pass
		#print(get_node('%Boat').position)
		#print(get_node('%Boat').get_child(1).shape.get_rect())

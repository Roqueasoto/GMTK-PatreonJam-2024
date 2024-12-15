extends Area2D

var boat_speed = 500

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var boat_velocity = Vector2.ZERO # The player's movement vector.
	if Input.is_action_pressed("Boat left"):
		boat_velocity.x -= boat_speed
	if Input.is_action_pressed("Boat right"):
		boat_velocity.x += boat_speed
	
	self.position += boat_velocity * delta

	var boat_sprite = self.get_child(0)
	if boat_velocity.length() > 0:
		boat_sprite.animation = "row"
		boat_sprite.play()
	else:
		boat_sprite.stop()

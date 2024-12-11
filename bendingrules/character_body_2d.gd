extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0


func _physics_process(delta: float) -> void:
	# Add the gravity.
	#if not is_on_floor():
		#velocity += get_gravity() * delta

	# Handle jump.
	#if Input.is_action_just_pressed("ui_accept") :
		#velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("hook_left", "hook_right")
	var being_reeled = Input.is_action_pressed("hook_up")
	if being_reeled and not direction:
		velocity.y = -SPEED
		velocity.x = -SPEED
	elif not being_reeled and not direction:
		velocity.y = SPEED/2
		velocity.x = 0.0
	elif being_reeled and direction:
		velocity.y = -SPEED
		velocity.x = -SPEED/3.0+direction*SPEED
	elif not being_reeled and direction:
		velocity.x = direction*SPEED
	elif not direction:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		



	move_and_slide()

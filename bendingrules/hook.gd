extends RigidBody2D

@onready var collision_sound: RandomPitchAudioPlayer = $CollisionSound

func _on_body_entered(_body: Node) -> void:
	collision_sound.pitch_shift_and_play()

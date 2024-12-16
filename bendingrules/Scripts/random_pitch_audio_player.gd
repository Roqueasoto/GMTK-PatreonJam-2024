class_name RandomPitchAudioPlayer
extends AudioStreamPlayer2D

@export var UPPER_BOUND_PITCH_SHIFT: float
@export var LOWER_BOUND_PITCH_SHIFT: float

# Method to pitch shift the sound of a audio-player within a set range.
func pitch_shift_sound() -> void:
	var pitch = randf_range(LOWER_BOUND_PITCH_SHIFT, UPPER_BOUND_PITCH_SHIFT)
	pitch_scale = pitch

func pitch_shift_and_play() -> void:
	pitch_shift_sound()
	play()

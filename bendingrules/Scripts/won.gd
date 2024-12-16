extends Control

@onready var button_hover_sfx: RandomPitchAudioPlayer = $VBoxContainer/ButtonHoverSfx

func _on_exit_pressed() -> void:
	get_tree().quit()

func _on_exit_mouse_entered() -> void:
	button_hover_sfx.pitch_shift_and_play()

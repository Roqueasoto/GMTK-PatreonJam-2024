extends Control

@onready var button_hover_sfx: RandomPitchAudioPlayer = $MarginContainer/ButtonHoverSfx

func _on_play_pressed() -> void:
	get_tree().change_scene_to_file("res://level_1.tscn")

func _on_exit_pressed() -> void:
	get_tree().quit()

func _on_play_mouse_entered() -> void:
	button_hover_sfx.pitch_shift_and_play()

func _on_exit_mouse_entered() -> void:
	button_hover_sfx.pitch_shift_and_play()

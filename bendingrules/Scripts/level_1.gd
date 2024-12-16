extends Node2D

@onready var level_enter_sound: AudioStreamPlayer2D = $LevelEnterSound

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	level_enter_sound.play()

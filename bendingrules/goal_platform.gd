extends Area2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Enable debug monitoring
	set_process(true)
	# Print when ready
	print("Debug monitoring enabled for Area2D")


func _on_body_entered(body: Node2D) -> void:
	print("winner")
	get_tree().change_scene_to_file("res://main_menu.tscn")

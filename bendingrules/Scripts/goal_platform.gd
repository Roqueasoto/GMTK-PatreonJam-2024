extends Area2D


func _on_body_entered(_body: Node2D) -> void:
	get_tree().change_scene_to_file("res://Scenes/won.tscn")

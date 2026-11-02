extends Control

@onready var project_text = $Project

func _ready() -> void:
	project_text.text = global.current_project["name"]



func _on_add_vokabulary_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/add_vokabulary.tscn")

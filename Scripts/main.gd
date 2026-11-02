extends Control

@onready var project_list = $ItemList

func _ready() -> void:
	update_project_list()

func _on_create_project_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/create_project.tscn")

func update_project_list():
	project_list.item_count = global.projects.size()
	for i in range(0,global.projects.size()):
		project_list.set_item_text(i,global.projects[i]["name"])

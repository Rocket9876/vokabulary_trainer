extends Control


func _on_create_project_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/create_project.tscn")


func _ready() -> void:
	$Streak.text = "STREAK: " + str(global.streak)

func _on_project_list_item_clicked(index: int, at_position: Vector2, mouse_button_index: int) -> void:
	global.current_project = global.projects[index]
	global.current_project_index = index
	get_tree().change_scene_to_file("res://Scenes/project.tscn")

extends Control

@onready var project_list = $"Project list"
var projects_without

var current_vocabulary


func _ready() -> void:
	if FileAccess.file_exists(global.current_project["path"] + "vocabulary"):
		var file = global.loading_data(global.current_project["path"] + "vocabulary")
		current_vocabulary = file.get_var()
		file.close()
	else:
		current_vocabulary = []
	projects_without = global.projects
	projects_without.erase(global.current_project)
	project_list.item_count = projects_without.size()
	for i in range(0,projects_without.size()):
		project_list.set_item_text(i,global.projects[i]["name"])

func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/project.tscn")


func _on_project_list_item_clicked(index: int, at_position: Vector2, mouse_button_index: int) -> void:
	if mouse_button_index == 1:
		if FileAccess.file_exists(projects_without[index]["path"] + "vocabulary"):
			var file = global.loading_data(projects_without[index]["path"] + "vocabulary")
			var imported_vocabulary = file.get_var()
			file.close()
			for i in imported_vocabulary:
				i = {global.current_project["first language"]:i[projects_without[index]["first language"]],global.current_project["second language"]:i[projects_without[index]["second language"]],"grammar": i["grammar"],"value":0}
			current_vocabulary += imported_vocabulary
			global.saving_data(global.current_project["path"] + "vocabulary",current_vocabulary)
			get_tree().change_scene_to_file("res://Scenes/project.tscn")

		else:
			$warning.visible = true
	

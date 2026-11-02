extends Control

@onready var name_edit = $Name
@onready var missing_name_warning = $missing_name
@onready var already_exists_warning = $already_exists

func _on_save_pressed() -> void:
	var name = name_edit.text.strip_edges()
	if name.replace(" ", "") == "":
		missing_name_warning.visible = true
		already_exists_warning.visible = false
	else:
		var duplicate = false 
		for I in global.projects:
			if I["name"] == name:
				duplicate = true
		if not duplicate:
			global.projects += [{"name":name,"path":global.folder_path + name + "/"}]
			global.save_projects()
			get_tree().change_scene_to_file(global.main_path)
		else:
			missing_name_warning.visible = false
			already_exists_warning.visible = true


func _on_back_pressed() -> void:
	get_tree().change_scene_to_file(global.main_path)

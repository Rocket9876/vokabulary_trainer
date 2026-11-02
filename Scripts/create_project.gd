extends Control

@onready var name_edit = $Name
@onready var first_lang_edit = $first_language
@onready var second_lang_edit = $second_language
@onready var grammar_checkbox = $grammar


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
			global.create_new_project(name,global.folder_path + name + "/",first_lang_edit.text.strip_edges(),second_lang_edit.text.strip_edges(),grammar_checkbox.button_pressed)
			get_tree().change_scene_to_file(global.main_path)
		else:
			missing_name_warning.visible = false
			already_exists_warning.visible = true


func _on_back_pressed() -> void:
	get_tree().change_scene_to_file(global.main_path)

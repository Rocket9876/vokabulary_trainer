extends Control

@onready var project_text = $Project

func _ready() -> void:
	if not FileAccess.file_exists(global.current_project["path"] + "vocabulary"):
		$"test vocabulary".disabled = true
		$"test vocabulary".tooltip_text = "you need to add more vocabulary to test your vocabulary"
		$"view vocabulary".disabled = true
		$"view vocabulary".tooltip_text = "you need to add more vocabulary to view your vocabulary"
	project_text.text = global.current_project["name"]



func _on_add_vocabulary_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/add_vocabulary.tscn")


func _on_test_vocabulary_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/test_vocabulary preperation.tscn")


func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/main.tscn")


func _on_import_vocabulary_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/import_vocabulary.tscn")


func _on_delete_project_pressed() -> void:
	$"final warning".visible = true


func _on_cancel_pressed() -> void:
	$"final warning".visible = false
	
	


func _on_delete_final_pressed() -> void:
	global.delete_project(global.current_project)
	get_tree().change_scene_to_file("res://Scenes/main.tscn")


func _on_view_vocabulary_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/view_vocabulary.tscn")

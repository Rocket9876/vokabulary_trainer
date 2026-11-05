extends Control

@onready var project_text = $Project

func _ready() -> void:
	if not FileAccess.file_exists(global.current_project["path"] + "vokabulary"):
		$"test vokabulary".disabled = true
		$"test vokabulary".tooltip_text = "you need to add more vokabulary to test your vokabulary"
		$"view vokabulary".disabled = true
		$"view vokabulary".tooltip_text = "you need to add more vokabulary to view your vokabulary"
	project_text.text = global.current_project["name"]



func _on_add_vokabulary_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/add_vokabulary.tscn")


func _on_test_vokabulary_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/test_vokabulary preperation.tscn")


func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/main.tscn")


func _on_import_vokabulary_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/import_vokabulary.tscn")


func _on_delete_project_pressed() -> void:
	$"final warning".visible = true


func _on_cancel_pressed() -> void:
	$"final warning".visible = false
	
	


func _on_delete_final_pressed() -> void:
	global.delete_project(global.current_project)
	get_tree().change_scene_to_file("res://Scenes/main.tscn")


func _on_view_vokabulary_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/view_vokabulary.tscn")

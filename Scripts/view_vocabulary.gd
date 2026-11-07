extends Control

var vocabulary = []

var index

func _ready() -> void:
	pass

func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/project.tscn")



func _on_vocabulary_list_item_clicked(_index: int, at_position: Vector2, mouse_button_index: int) -> void:
	if mouse_button_index == 1:
		index = _index
		$"final warning".visible = true


func _on_cancel_pressed() -> void:
	$"final warning".visible = false


func _on_delete_final_pressed() -> void:
	$"vocabulary list".vocabulary.remove_at(index)
	if not $"vocabulary list".vocabulary == []:
		global.saving_data(global.current_project["path"] + "vocabulary",$"vocabulary list".vocabulary)
	else:
		DirAccess.remove_absolute(global.current_project["path"] + "vocabulary")
		get_tree().change_scene_to_file("res://Scenes/project.tscn")
	$"vocabulary list"._ready()
	$"final warning".visible = false

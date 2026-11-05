extends Control

var vokabulary = []

var index

func _ready() -> void:
	pass

func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/project.tscn")



func _on_vokabulary_list_item_clicked(_index: int, at_position: Vector2, mouse_button_index: int) -> void:
	index = _index
	$"final warning".visible = true


func _on_cancel_pressed() -> void:
	$"final warning".visible = false


func _on_delete_final_pressed() -> void:
	$"vokabulary list".vokabulary.remove_at(index)
	global.saving_data(global.current_project["path"] + "vokabulary",$"vokabulary list".vokabulary)
	$"vokabulary list"._ready()
	$"final warning".visible = false

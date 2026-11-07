extends Control



func _ready() -> void:
	pass

func _on_continue_pressed() -> void:
	var selected = $"vocabulary list".get_selected_items()
	for I in selected:
		global.asked_vocabulary += [global.load_current_vocabulary()[I]]
	get_tree().change_scene_to_file("res://Scenes/vocabulary_test.tscn")
	


func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/test_vocabulary preperation.tscn")

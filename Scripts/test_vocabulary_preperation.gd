extends Control

@onready var grammar_checkbox = $grammar
@onready var vocabulary_amount = $"amount vocabulary"
@onready var vocabulary_test_direction = $"vocabulary test direction"
@onready var infinity_checkbox = $"infinity modus"
@onready var select_vocabulary = $"select vocabulary"

func _ready() -> void:
	grammar_checkbox.visible = global.current_project["grammar"]
	grammar_checkbox.button_pressed = global.current_project["grammar"]
	
	vocabulary_test_direction.set_item_text(0,global.current_project["first language"] + " <=> " + global.current_project["second language"])
	vocabulary_test_direction.set_item_text(1,global.current_project["first language"] + " => " + global.current_project["second language"])
	vocabulary_test_direction.set_item_text(2,global.current_project["second language"] + " => " + global.current_project["first language"])




func _on_button_pressed() -> void:
	if int(vocabulary_amount.text) > 0:
		global.vocabulary_settings = {"test direction index":vocabulary_test_direction.selected,"advanced":$advanced.button_pressed,"grammar":grammar_checkbox.button_pressed,"amount":int(vocabulary_amount.text),"infinity":infinity_checkbox.button_pressed}
	else:
		global.vocabulary_settings = {"test direction index":vocabulary_test_direction.selected,"advanced":$advanced.button_pressed,"grammar":grammar_checkbox.button_pressed,"amount":0,"infinity":infinity_checkbox.button_pressed}
	if select_vocabulary.button_pressed:
		get_tree().change_scene_to_file("res://Scenes/select_vocabulary.tscn")
	else:
		get_tree().change_scene_to_file("res://Scenes/vocabulary_test.tscn")


func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/project.tscn")

extends Control

@onready var grammar_checkbox = $grammar
@onready var vokabulary_amount = $"amount vokabulary"
@onready var vokabulary_test_direction = $"vokabulary test direction"

func _ready() -> void:
	grammar_checkbox.visible = global.current_project["grammar"]
	grammar_checkbox.button_pressed = global.current_project["grammar"]
	
	vokabulary_test_direction.set_item_text(0,global.current_project["first language"] + " <=> " + global.current_project["second language"])
	vokabulary_test_direction.set_item_text(1,global.current_project["first language"] + " => " + global.current_project["second language"])
	vokabulary_test_direction.set_item_text(2,global.current_project["second language"] + " => " + global.current_project["first language"])




func _on_button_pressed() -> void:
	if int(vokabulary_amount.text) > 0:
		global.vokabulary_settings = {"test direction index":vokabulary_test_direction.selected,"advanced":$advanced.button_pressed,"grammar":grammar_checkbox.button_pressed,"amount":int(vokabulary_amount.text)}
	else:
		global.vokabulary_settings = {"test direction index":vokabulary_test_direction.selected,"advanced":$advanced.button_pressed,"grammar":grammar_checkbox.button_pressed,"amount":0}
	get_tree().change_scene_to_file("res://Scenes/vokabulary_test.tscn")


func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/project.tscn")

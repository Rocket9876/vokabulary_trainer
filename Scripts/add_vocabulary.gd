extends Control

@onready var first_lang_edit = $"first lang"
@onready var second_lang_edit = $"second lang"
@onready var grammar_edit = $"grammar"

func _ready() -> void:
	first_lang_edit.placeholder_text = global.current_project["first language"]
	second_lang_edit.placeholder_text = global.current_project["second language"]
	grammar_edit.visible = global.current_project["grammar"]


func _on_save_pressed() -> void:
	$AnimationPlayer.play("vocabulary updatet")
	if global.current_project["grammar"]:
		global.save_new_vocabulary(global.current_project,first_lang_edit.text,second_lang_edit.text,grammar_edit.text)
	else:
		global.save_new_vocabulary(global.current_project,first_lang_edit.text,second_lang_edit.text)
	first_lang_edit.text = ""
	second_lang_edit.text = ""
	grammar_edit.text = ""


func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/project.tscn")

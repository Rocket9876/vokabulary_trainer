extends Control

func _ready() -> void:
	$stats.text = "You got " + str((global.vokabulary_stats["right"] / (global.vokabulary_stats["right"] + global.vokabulary_stats["wrong"])) * 100) + "% correct!"
	$time.text = "And it took you " + str(int(global.timer_time)) + " seconds to complete the test!"


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/main.tscn")

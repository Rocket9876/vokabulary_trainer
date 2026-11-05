extends Control

@export var max_value:int

@export var min_value:int

@onready var lang_edit = $"lang edit"
@onready var vokabulary_item = $"vokabulary item"
@onready var grammar_edit = $grammar

@onready var grammar_correction = $"solution/grammar correction"
@onready var translate_correction = $"solution/translate correction"

@onready var timer = $Timer

@onready var stats_text = $solution/Stats

var expected_result

var expected_grammar_result

var stats = {"right":0,"wrong":0,"vokabulary asked":0}

var vokabulary

var amount

var index

var timer_time = 0


func _physics_process(delta: float) -> void:
	timer_func(delta)

func _ready() -> void:
	grammar_edit.visible = global.vokabulary_settings["grammar"]
	var file = global.loading_data(global.current_project["path"] + "vokabulary")
	vokabulary = file.get_var()
	grammar_correction.visible = global.current_project["grammar"]
	file.close()
	if global.vokabulary_settings["infinity"]:
		amount = 9999999999
	elif global.vokabulary_settings["amount"] > 0:
		amount = global.vokabulary_settings["amount"]
	else:
		amount = vokabulary.size() - 1
		
	
	new_vokabulary()

func new_vokabulary():
	
	


	index = randi_range(0,vokabulary.size() - 1)
	if (global.vokabulary_settings["advanced"] and randi_range(min_value,vokabulary[index]["value"]) == min_value) or (not global.vokabulary_settings["advanced"]):
		if global.vokabulary_settings["test direction index"] == 0:
			dir_index(randi_range(1,2))
		else:
			dir_index(global.vokabulary_settings["test direction index"])
	else:
		new_vokabulary()


func dir_index(number):
	if number == 1:
		vokabulary_item.text = "What does " + vokabulary[index][global.current_project["first language"]] + " mean in " + global.current_project["second language"] + "?"
		lang_edit.placeholder_text = global.current_project["first language"]
		expected_grammar_result = vokabulary[index]["grammar"]
		expected_result = vokabulary[index][global.current_project["second language"]].to_upper()
	else:
		vokabulary_item.text = "What does " + vokabulary[index][global.current_project["second language"]] + " mean in " + global.current_project["second language"] + "?"
		lang_edit.placeholder_text = global.current_project["second language"]
		expected_grammar_result = vokabulary[index]["grammar"]
		expected_result = vokabulary[index][global.current_project["first language"]].to_upper()

func _on_continue_pressed() -> void:
	amount -= 1
	stats["vokabulary asked"] += 1
	if not amount <= 0:
		if not global.vokabulary_settings["infinity"]:
			vokabulary.remove_at(index)
		lang_edit.text = ""
		grammar_edit.text = ""
		$AnimationPlayer.play("out")
		new_vokabulary()
	else:
		global.vokabulary_stats = stats
		global.timer_time = timer_time
		get_tree().change_scene_to_file("res://Scenes/vokabulary_test_finish.tscn")
	


func _on_button_pressed() -> void:
	var solution
	solution = lang_edit.text.to_upper() == expected_result and grammar_edit.text.to_upper() == expected_grammar_result
	$"solution/big text correct".visible = solution
	$"solution/big text wrong".visible = !solution
	if solution:
		stats["right"] += 1
	else:
		stats["wrong"] += 1
	if global.vokabulary_settings["advanced"]:
		value_advanced(solution)
	
	translate_correction.text = "Correct translation:\n" + expected_result
	grammar_correction.text = "Correct grammar:\n" + expected_grammar_result
	stats_text.text = "Stats:\nCorrect answers: " + str(stats["right"]) + "\nWrong answers: " +  str(stats["wrong"])
	$AnimationPlayer.play("in")


func timer_func(delta):
	timer_time += delta
	timer.text = str(int(timer_time))

func value_advanced(correct):
	if correct:
		vokabulary[index]["value"] += 1
		if vokabulary[index]["value"] > max_value:
			vokabulary[index]["value"] = max_value
	else:
		vokabulary[index]["value"] -= 1
		if vokabulary[index]["value"] < min_value:
			vokabulary[index]["value"] = min_value


func _on_stop_pressed() -> void:
		global.vokabulary_stats = stats
		global.timer_time = timer_time
		get_tree().change_scene_to_file("res://Scenes/vokabulary_test_finish.tscn")

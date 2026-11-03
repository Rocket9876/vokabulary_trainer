extends Control

@onready var lang_edit = $"lang edit"
@onready var vokabulary_item = $"vokabulary item"
@onready var grammar_edit = $grammar

var vokabulary

var amount

func _ready() -> void:
	grammar_edit.visible = global.vokabulary_settings["grammar"]
	var file = global.loading_data(global.current_project["path"] + "vokabulary")
	vokabulary = file.get_var()
	print(file.get_var())
	file.close()
	if global.vokabulary_settings["amount"] > 0:
		amount = global.vokabulary_settings["amount"]
	else:
		amount = vokabulary.size() - 1
	new_vokabulary()

func new_vokabulary():
	var expected_result
	var expected_grammar_result
	var index
	if global.vokabulary_settings["advanced"]:
		pass
	else:
		index = randi_range(0,vokabulary.size() - 1)
		print(vokabulary)
		if global.vokabulary_settings["test direction index"] == 0:
			if randi_range(1,2) == 1:
				vokabulary_item.text = vokabulary[index][global.current_project["first language"]]
				expected_grammar_result = vokabulary[index]["grammar"]
				expected_result = vokabulary[index][global.current_project["second language"]].to_upper()
			else:
				vokabulary_item.text = vokabulary[index][global.current_project["second language"]]
				expected_grammar_result = vokabulary[index]["grammar"]
				expected_result = vokabulary[index][global.current_project["first language"]].to_upper()

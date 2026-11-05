extends ItemList

var vokabulary

func _ready() -> void:
	var file = global.loading_data(global.current_project["path"] + "vokabulary")
	vokabulary = file.get_var()
	file.close()
	item_count = vokabulary.size()
	if global.current_project["grammar"]:
		for i in range(0,vokabulary.size()):
			set_item_text(i,vokabulary[i][global.current_project["first language"]] + " => " + vokabulary[i][global.current_project["second language"]] + " | " + vokabulary[i]["grammar"])
	else:
		for i in range(0,vokabulary.size()):
			set_item_text(i,vokabulary[i][global.current_project["first language"]] + " => " + vokabulary[i][global.current_project["second language"]])

extends ItemList

var vocabulary

func _ready() -> void:
	if FileAccess.file_exists(global.current_project["path"] + "vocabulary"):
		var file = global.loading_data(global.current_project["path"] + "vocabulary")
		vocabulary = file.get_var()
		file.close()
		item_count = vocabulary.size()
		if global.current_project["grammar"]:
			for i in range(0,vocabulary.size()):
				set_item_text(i,vocabulary[i][global.current_project["first language"]] + " => " + vocabulary[i][global.current_project["second language"]] + " | " + vocabulary[i]["grammar"])
		else:
			for i in range(0,vocabulary.size()):
				set_item_text(i,vocabulary[i][global.current_project["first language"]] + " => " + vocabulary[i][global.current_project["second language"]])

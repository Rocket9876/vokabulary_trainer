extends ItemList

func _ready() -> void:
	item_count = global.projects.size()
	for i in range(0,global.projects.size()):
		set_item_text(i,global.projects[i]["name"])

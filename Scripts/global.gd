extends Node

var folder_path = "user://vokabulary_trainer/"

var projects_path = folder_path + "projects"

var main_path = "res://Scenes/main.tscn"

var projects = []

func _ready() -> void:
	startup_loading_data()



func startup_loading_data():
	load_projects()
	print(projects)



func loading_data(path):
	return FileAccess.open(path, FileAccess.READ)

func saving_data(path,data):
	var file = FileAccess.open(path,FileAccess.WRITE)
	file.store_var(data)
	file.close()

func load_projects():
	if FileAccess.file_exists(projects_path):
		var file = loading_data(projects_path)
		projects = file.get_var()
		file.close()

func save_projects():
	saving_data(projects_path,projects)

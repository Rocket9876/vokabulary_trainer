extends Node

var folder_path = "user://vokabulary_trainer/"

var projects_path = folder_path + "projects"

var main_path = "res://Scenes/main.tscn"

var projects = []

var vokabulary_settings = {}

func _ready() -> void:
	startup_loading_data()

var current_project

var current_project_index

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

func create_new_project(name,path,first_lang,second_lang,grammar = false):
	projects += [{"name":name,"path":path,"first language": first_lang, "second language": second_lang, "grammar":grammar}]
	DirAccess.make_dir_absolute(path)
	save_projects()


func save_new_vokabulary(project:Dictionary,first_lang_vok,second_lang_vok,grammar = ""):
	var vokabulary
	if FileAccess.file_exists(project["path"] + "vokabulary"):
		var file = loading_data(project["path"] + "vokabulary")
		vokabulary = file.get_var()
		file.close()
	else:
		vokabulary = []
	vokabulary += [{project["first language"]:first_lang_vok,project["second language"]:second_lang_vok,"value":0,"grammar":grammar}]
	saving_data(project["path"] + "vokabulary",vokabulary)

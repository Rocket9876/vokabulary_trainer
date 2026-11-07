extends Node

var folder_path = "user://vocabulary_trainer/"

var projects_path = folder_path + "projects"

var main_path = "res://Scenes/main.tscn"

var projects = []

var vocabulary_settings = {}

var vocabulary_stats

var timer_time = 0

var asked_vocabulary = []

func _ready() -> void:
	DirAccess.make_dir_absolute(folder_path)
	startup_loading_data()
	streak_system()

var current_project

var current_project_index

var streak = 0


func startup_loading_data():
	load_projects()

func get_day_count():
	return int(Time.get_unix_time_from_system()/86400)


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


func save_new_vocabulary(project:Dictionary,first_lang_vok,second_lang_vok,grammar = ""):
	var vocabulary
	if FileAccess.file_exists(project["path"] + "vocabulary"):
		var file = loading_data(project["path"] + "vocabulary")
		vocabulary = file.get_var()
		file.close()
	else:
		vocabulary = []
	vocabulary += [{project["first language"]:first_lang_vok,project["second language"]:second_lang_vok,"value":0,"grammar":grammar}]
	saving_data(project["path"] + "vocabulary",vocabulary)


func streak_system():
	if FileAccess.file_exists(folder_path + "streak"):
		
		var file = loading_data(folder_path + "streak")
		var streak_temp = file.get_var()
		file.close()
		if streak_temp["day"] + 1 == get_day_count():
			saving_data(folder_path + "streak",{"day": get_day_count(),"streak":streak_temp["streak"] + 1})
			streak = streak_temp["streak"] + 1
		elif streak_temp["day"] + 1 < get_day_count():
			saving_data(folder_path + "streak",{"day": get_day_count(),"streak":1})
			streak = 1
		else:
			streak = streak_temp["streak"]
	else:
		saving_data(folder_path + "streak",{"day": get_day_count(),"streak":1})
		streak = 1


func delete_project(project):
	DirAccess.remove_absolute(project["path"])
	projects.erase(project)
	save_projects()

func load_current_vocabulary():
	var file = loading_data(current_project["path"] + "vocabulary")
	var vocabulary = file.get_var()
	file.close()
	return vocabulary

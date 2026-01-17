extends Node

var arts: Dictionary = {}

func _ready():
	_load_arts()

func _load_arts():
	var dir := DirAccess.open("res://Resources/Arts/")
	if dir:
		for file_name in dir.get_files():
			if file_name.ends_with(".tres"):
				var art: ArtRes = load("res://Resources/Arts/" + file_name)
				if art and art.id != "":
					arts[art.id] = art

func get_art(id: String) -> ArtRes:
	return arts.get(id)

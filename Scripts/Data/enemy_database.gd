extends Node

var enemies: Dictionary = {}

func _ready():
	_load_foes()

func _load_foes():
	var dir := DirAccess.open("res://Resources/Foes/")
	if dir:
		for file_name in dir.get_files():
			if file_name.ends_with(".tres"):
				var foe: EnemyData = load("res://Resources/Foes/" + file_name)
				if foe and foe.id != "":
					enemies[foe.id] = foe

func get_foe(id: String) -> EnemyData:
	return enemies.get(id)

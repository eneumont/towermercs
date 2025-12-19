extends Node

var items: Dictionary = {}

func _ready():
	_load_items()

func _load_items():
	var dir := DirAccess.open("res://Resources/Items/")
	if dir:
		for file_name in dir.get_files():
			if file_name.ends_with(".tres"):
				var item: ItemRes = load("res://Resources/Items/" + file_name)
				if item and item.id != "":
					items[item.id] = item

func get_item(id: String) -> ItemRes:
	return items.get(id)

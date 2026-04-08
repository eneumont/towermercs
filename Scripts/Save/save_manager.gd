extends Node

const SAVE_DIR := "user://saves/"
const SAVE_EXT := ".json"

var save_slots: Dictionary = {}
var recent: String = ""

func _ready():
	#SaveManager.delete_save(0, true)
	#SaveManager.delete_save(1)
	#SaveManager.delete_save(2)
	#SaveManager.delete_save(3)
	
	_load_save_metadata()

##saving note 0 -> auto, 1,2,3 -> regular
func save_game(slot: int, data: Dictionary, autosave := false) -> void:
	var dir := DirAccess.open(SAVE_DIR)
	if not dir:
		DirAccess.make_dir_recursive_absolute(SAVE_DIR)
	
	var path := _get_save_path(slot, autosave)
	var file := FileAccess.open_encrypted_with_pass(path, FileAccess.WRITE, "4578ri82bhe")
	if file:
		data["meta"] = data.merged({
			"timestamp": Time.get_datetime_string_from_system(),
			"playtime": _get_playtime_string()
		})
		
		file.store_string(JSON.stringify(data, "\t"))
		file.close()
		_load_save_metadata()
		
		recent = str(slot) + " " + str(autosave)

##saving note 0 -> auto, 1,2,3 -> regular
func load_game(slot: int, autosave := false) -> Dictionary:
	var path := _get_save_path(slot, autosave)
	if not FileAccess.file_exists(path):
		push_warning("No save file found at: %s" % path)
		return {}
	
	var file := FileAccess.open_encrypted_with_pass(path, FileAccess.READ, "4578ri82bhe")
	var content := file.get_as_text()
	file.close()
	
	var parsed = JSON.parse_string(content)
	if typeof(parsed) != TYPE_DICTIONARY:
		push_warning("Invalid save format.")
		return {}
	
	return parsed

func delete_save(slot: int, autosave := false) -> void:
	var path := _get_save_path(slot, autosave)
	if FileAccess.file_exists(path):
		DirAccess.remove_absolute(path)
		_load_save_metadata()

func _load_save_metadata():
	save_slots.clear()
	var dir := DirAccess.open(SAVE_DIR)
	if not dir:
		return
	
	for file_name in dir.get_files():
		if file_name.ends_with(SAVE_EXT):
			var path := SAVE_DIR + file_name
			var slot_id := int(file_name.trim_prefix("save_").trim_suffix(SAVE_EXT))
			var file := FileAccess.open_encrypted_with_pass(path, FileAccess.READ, "4578ri82bhe")
			var parsed = JSON.parse_string(file.get_as_text())
			file.close()
			
			if typeof(parsed) == TYPE_DICTIONARY and parsed.has("meta"):
				save_slots[slot_id] = parsed["meta"]

func list_saves() -> Dictionary:
	return save_slots

func _get_save_path(slot: int, autosave: bool = false) -> String:
	return SAVE_DIR + ("autosave" if autosave else "save_%d" % slot) + SAVE_EXT

func _get_playtime_string() -> String:
	return "%02d:%02d:%02d" % [randi() % 24, randi() % 60, randi() % 60]

#saving note 0 -> auto, 1,2,3 -> regular

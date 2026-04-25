extends Node

@export var slot: int

@onready var full: VBoxContainer = $Full
@onready var name_txt: Label = $Full/NameTxt
@onready var party_imgs: HBoxContainer = $Full/PartyImgs
@onready var party_1: TextureRect = $Full/PartyImgs/Party1
@onready var party_2: TextureRect = $Full/PartyImgs/Party2
@onready var party_3: TextureRect = $Full/PartyImgs/Party3
@onready var party_4: TextureRect = $Full/PartyImgs/Party4
@onready var area_txt: Label = $Full/AreaTxt
@onready var money_txt: Label = $Full/MoneyTxt
@onready var collection_txt: Label = $Full/CollectionTxt
@onready var time_txt: Label = $Full/TimeTxt
@onready var empty: Label = $Empty

var full_game: bool
var title_ui

func _ready() -> void:
	full_game = FileAccess.file_exists("user://saves/save_" + str(slot) + ".json") if slot > 0 else FileAccess.file_exists("user://saves/autosave.json")
	design(full_game)

func click():
	if title_ui.delete:
		if slot > 0:
			full_game = false
			SaveManager.delete_save(slot)
			design(false)
		title_ui.delete = false
	else:
		if full_game:
			PlayerData.load_save(SaveManager.load_game(slot) if slot > 0 else SaveManager.load_game(slot, true))
			title_ui.pick_save()
		else:
			title_ui.new_click()

func design(used: bool):
	full.visible = used
	empty.visible = !used
	
	if used:
		var data = SaveManager.load_game(slot) if slot > 0 else SaveManager.load_game(slot, true)
		
		var i = 0
		for p in party_imgs.get_child_count():
			party_imgs.get_children()[p].texture = load("res://Images/Textures/Icons/Characters/" + CharData.ClassType.keys()[int(data["meta"]["party"][i]["class_type"])].capitalize() + ".png")
			i += 1
		
		area_txt.text = "Area: " + data["cur_scn"]
		money_txt.text = "Money: " + str(data["money"])
		collection_txt.text = "Collection: " + (str(data["collection"].size() + data["party"].size() + data["reserve"].size()))
		time_txt.text = "Time: " + data["time"]
		name_txt.text = data["name"]

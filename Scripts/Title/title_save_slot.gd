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
	full_game = FileAccess.file_exists("user://saves/save_" + str(slot) + ".json")
	design(full_game)

func click():
	if title_ui.delete:
		if slot > 1:
			delete_save()
			design(false)
		title_ui.delete = false
	else:
		if full_game: title_ui.pick_save()

func delete_save():
	if full_game:
		SaveManager.delete_save(slot)

func design(used: bool):
	full.visible = used
	empty.visible = !used
	
	if used:
		var data = SaveManager.load_game(slot)
		
		for p in party_imgs.get_child_count():
			var test = data["meta"]["party"][slot - 1]
			match data["meta"]["party"][slot - 1].class_type:
				CharData.ClassType.KNIGHT:
					party_imgs.get_children()[p].texture = load("res://Images/Textures/Icons/Characters/Knight.png")
				CharData.ClassType.THIEF:
					party_imgs.get_children()[p].texture = load("res://Images/Textures/Icons/Characters/Thief.png")
				CharData.ClassType.MAGE:
					party_imgs.get_children()[p].texture = load("res://Images/Textures/Icons/Characters/Mage.png")
				CharData.ClassType.CLERIC:
					party_imgs.get_children()[p].texture = load("res://Images/Textures/Icons/Characters/Cleric.png")
				CharData.ClassType.ALCHEMIST:
					party_imgs.get_children()[p].texture = load("res://Images/Textures/Icons/Characters/Alchemist.png")
				CharData.ClassType.BARD:
					party_imgs.get_children()[p].texture = load("res://Images/Textures/Icons/Characters/Bard.png")
				CharData.ClassType.BRAWLER:
					party_imgs.get_children()[p].texture = load("res://Images/Textures/Icons/Characters/Brawler.png")
				CharData.ClassType.MEDIC:
					party_imgs.get_children()[p].texture = load("res://Images/Textures/Icons/Characters/Medic.png")
				CharData.ClassType.CLOWN:
					party_imgs.get_children()[p].texture = load("res://Images/Textures/Icons/Characters/Clown.png")
				CharData.ClassType.ARCANIST:
					party_imgs.get_children()[p].texture = load("res://Images/Textures/Icons/Characters/Arcanist.png")
				CharData.ClassType.DRUID:
					party_imgs.get_children()[p].texture = load("res://Images/Textures/Icons/Characters/Druid.png")
				CharData.ClassType.SWORDMASTER:
					party_imgs.get_children()[p].texture = load("res://Images/Textures/Icons/Characters/Swordmaster.png")
				CharData.ClassType.HORROR:
					party_imgs.get_children()[p].texture = load("res://Images/Textures/Icons/Characters/Horror.png")
				CharData.ClassType.WITCH:
					party_imgs.get_children()[p].texture = load("res://Images/Textures/Icons/Characters/Witch.png")
					
		area_txt.text = data["cur_scn"]
		money_txt.text = data["money"]
		collection_txt.text = data["collection"].count() + data["party"].count() + data["reserve"].count()
		time_txt.text = data["time"]
		name_txt.text = data["name"]

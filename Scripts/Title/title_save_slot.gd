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
	
	if full_game:
		var data = SaveManager.load_game(slot)
		full.visible = true
		empty.visible = false
		
	else:
		full.visible = false
		empty.visible = true

func click():
	if full_game:
		title_ui.pick_save()

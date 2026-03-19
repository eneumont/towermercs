extends Button

@onready var full: VBoxContainer = $FullSave
@onready var empty: Label = $EmptySave
@onready var name_txt: Label = $FullSave/NameTxt
@onready var party_img: HBoxContainer = $FullSave/PartyImg
@onready var img_one: TextureRect = $FullSave/PartyImg/ImgOne
@onready var img_two: TextureRect = $FullSave/PartyImg/ImgTwo
@onready var img_three: TextureRect = $FullSave/PartyImg/ImgThree
@onready var img_four: TextureRect = $FullSave/PartyImg/ImgFour
@onready var area_txt: Label = $FullSave/AreaTxt
@onready var money_txt: Label = $FullSave/MoneyTxt
@onready var collection_txt: Label = $FullSave/CollectionTxt
@onready var time_txt: Label = $FullSave/TimeTxt

@export var slot: int

func setup():
	if not FileAccess.file_exists("user://saves/save_" + str(slot) + ".json"):
		empty.visible = true
		full.visible = false
	else:
		var s_data = SaveManager.list_saves()[slot]
		empty.visible = false
		full.visible = true
		name_txt.text = s_data["name"]
		money_txt.text = "Money: " + str(s_data["money"])
		collection_txt.text = "Collection " + str(s_data["collection"].size())
		area_txt.text = "Area: " + s_data["cur_scn"]
		time_txt.text = "Time: " + s_data["time"]

func save():
	SaveManager.save_game(slot, PlayerData.save())
	setup()

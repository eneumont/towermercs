extends Button

@onready var cost_txt: Label = $VBox/CostTxt
@onready var name_txt: Label = $VBox/NameTxt
@onready var slot_img: TextureRect = $VBox/SlotImg
@onready var health_bar: ProgressBar = $VBox/HealthBar
@onready var health_txt: Label = $VBox/HealthBar/HealthTxt
@onready var artistry_bar: ProgressBar = $VBox/ArtistryBar
@onready var artistry_txt: Label = $VBox/ArtistryBar/HealthTxt

@export var num: int

var cost: int
var cost_mult: int
var ui

func setup():
	cost = (PlayerData.party[num].maxHP - PlayerData.party[num].curHP) + (PlayerData.party[num].maxAP - PlayerData.party[num].curAP) * cost_mult
	cost_txt.text = "Cost: " + str(cost)
	name_txt.text = PlayerData.party[num].display_name
	health_txt.text = "HP: " + str(PlayerData.party[num].curHP) + "/" + str(PlayerData.party[num].maxHP)
	health_bar.value = (PlayerData.party[num].curHP / PlayerData.party[num].maxHP) * 100
	artistry_txt.text = "AP: " + str(PlayerData.party[num].curAP) + "/" + str(PlayerData.party[num].maxAP)
	artistry_bar.value = (PlayerData.party[num].curAP / PlayerData.party[num].maxAP) * 100
	slot_img.texture = load("res://Images/Textures/Icons/Characters/" + CharData.ClassType.keys()[PlayerData.party[num].class_type].capitalize() + ".png")

func heal():
	if not cost > PlayerData.money:
		PlayerData.money -= cost
		ui.updateMoney()
		PlayerData.party[num].curHP = PlayerData.party[num].maxHP
		PlayerData.party[num].curAP = PlayerData.party[num].maxAP
		ui.rest_set()
	else:
		ui.talk(false, "Broke")

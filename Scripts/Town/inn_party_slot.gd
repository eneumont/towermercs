extends Button

@onready var name_txt: Label = $VBox/NameTxt
@onready var slot_img: TextureRect = $VBox/SlotImg
@onready var health_bar: ProgressBar = $VBox/HealthBar
@onready var health_txt: Label = $VBox/HealthBar/HealthTxt
@onready var artistry_bar: ProgressBar = $VBox/ArtistryBar
@onready var artistry_txt: Label = $VBox/ArtistryBar/HealthTxt

@export var num: int

func setup():
	name_txt.txt = PlayerData.party[num].display_name
	health_txt.txt = "HP: " + str(PlayerData.party[num].curHP) + "/" + str(PlayerData.party[num].maxHP)
	health_bar.value = int(PlayerData.party[num].curHP / PlayerData.party[num].maxHP)
	artistry_txt.txt = "AP: " + str(PlayerData.party[num].curAP) + "/" + str(PlayerData.party[num].maxAP)
	artistry_bar.value = int(PlayerData.party[num].curAP / PlayerData.party[num].maxAP)
	slot_img.texture = load("res://Images/Textures/Icons/Characters/");

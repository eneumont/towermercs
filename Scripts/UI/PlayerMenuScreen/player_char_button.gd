extends Control

@onready var name_txt: Label = $NameTxt
@onready var texture_rect: TextureRect = $TextureRect
@onready var health_bar: ProgressBar = $ValuesBox/HealthBar
@onready var h_ptxt: Label = $ValuesBox/HealthBar/HPtxt
@onready var artistry_bar: ProgressBar = $ValuesBox/ArtistryBar
@onready var a_ptxt: Label = $ValuesBox/ArtistryBar/APtxt
@onready var s_ptxt: Label = $ValuesBox/SPtxt

@export var menu: Control
@export var pos: int

func design():
	name_txt.text = PlayerData.party[pos].act_name + "Lv." + str(PlayerData.party[pos].cur_level)
	health_bar.value = (PlayerData.party[pos].curHP / PlayerData.party[pos].maxHP) * 100
	h_ptxt.text = "HP: " + str(PlayerData.party[pos].maxHP) + "/" + str(PlayerData.party[pos].curHP)
	artistry_bar.value = (PlayerData.party[pos].curAP / PlayerData.party[pos].maxAP) * 100
	a_ptxt.text = "AP: " + str(PlayerData.party[pos].maxAP) + "/" + str(PlayerData.party[pos].curAP)
	s_ptxt.text = "SP: " + str(PlayerData.party[pos].cur_sp)

func char_click():
	menu
	#get main menu and call char menu based on pos

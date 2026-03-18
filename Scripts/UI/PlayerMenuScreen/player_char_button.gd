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
	
	match PlayerData.party[pos].class_type:
		CharData.ClassType.KNIGHT:
			texture_rect.texture = load("res://Images/Textures/Icons/Characters/Knight.png")
		CharData.ClassType.THIEF:
			texture_rect.texture = load("res://Images/Textures/Icons/Characters/Thief.png")
		CharData.ClassType.MAGE:
			texture_rect.texture = load("res://Images/Textures/Icons/Characters/Mage.png")
		CharData.ClassType.CLERIC:
			texture_rect.texture = load("res://Images/Textures/Icons/Characters/Cleric.png")
		CharData.ClassType.ALCHEMIST:
			texture_rect.texture = load("res://Images/Textures/Icons/Characters/Alchemist.png")
		CharData.ClassType.BARD:
			texture_rect.texture = load("res://Images/Textures/Icons/Characters/Bard.png")
		CharData.ClassType.BRAWLER:
			texture_rect.texture = load("res://Images/Textures/Icons/Characters/Brawler.png")
		CharData.ClassType.MEDIC:
			texture_rect.texture = load("res://Images/Textures/Icons/Characters/Medic.png")
		CharData.ClassType.CLOWN:
			texture_rect.texture = load("res://Images/Textures/Icons/Characters/Clown.png")
		CharData.ClassType.ARCANIST:
			texture_rect.texture = load("res://Images/Textures/Icons/Characters/Arcanist.png")
		CharData.ClassType.DRUID:
			texture_rect.texture = load("res://Images/Textures/Icons/Characters/Druid.png")
		CharData.ClassType.SWORDMASTER:
			texture_rect.texture = load("res://Images/Textures/Icons/Characters/Swordmaster.png")
		CharData.ClassType.HORROR:
			texture_rect.texture = load("res://Images/Textures/Icons/Characters/Horror.png")
		CharData.ClassType.WITCH:
			texture_rect.texture = load("res://Images/Textures/Icons/Characters/Witch.png")

func char_click():
	menu.change_scr(9, 0, pos)

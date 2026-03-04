extends Button

@onready var name_txt: Label = $VBox/NameTxt
@onready var slot_img: TextureRect = $VBox/SlotImg
@onready var health_bar: ProgressBar = $VBox/HealthBar
@onready var health_txt: Label = $VBox/HealthBar/HealthTxt
@onready var artistry_bar: ProgressBar = $VBox/ArtistryBar
@onready var artistry_txt: Label = $VBox/ArtistryBar/HealthTxt

@export var num: int

func setup():
	name_txt.text = PlayerData.party[num].display_name
	health_txt.text = "HP: " + str(PlayerData.party[num].cur_stats[BeingData.StatType.HEALTH]) + "/" + str(PlayerData.party[num].stats[BeingData.StatType.HEALTH])
	health_bar.value = int(PlayerData.party[num].cur_stats[BeingData.StatType.HEALTH] / PlayerData.party[num].stats[BeingData.StatType.HEALTH])
	artistry_txt.text = "AP: " + str(PlayerData.party[num].cur_stats[BeingData.StatType.ARTISTRY]) + "/" + str(PlayerData.party[num].stats[BeingData.StatType.HEALTH])
	artistry_bar.value = int(PlayerData.party[num].cur_stats[BeingData.StatType.ARTISTRY] / PlayerData.party[num].stats[BeingData.StatType.HEALTH])
	
	match PlayerData.party[num].class_type:
		CharData.ClassType.KNIGHT:
			slot_img.texture = load("res://Images/Textures/Icons/Characters/Knight.png")
		CharData.ClassType.THIEF:
			slot_img.texture = load("res://Images/Textures/Icons/Characters/Thief.png")
		CharData.ClassType.MAGE:
			slot_img.texture = load("res://Images/Textures/Icons/Characters/Mage.png")
		CharData.ClassType.CLERIC:
			slot_img.texture = load("res://Images/Textures/Icons/Characters/Cleric.png")
		CharData.ClassType.ALCHEMIST:
			slot_img.texture = load("res://Images/Textures/Icons/Characters/Alchemist.png")
		CharData.ClassType.BARD:
			slot_img.texture = load("res://Images/Textures/Icons/Characters/Bard.png")
		CharData.ClassType.BRAWLER:
			slot_img.texture = load("res://Images/Textures/Icons/Characters/Brawler.png")
		CharData.ClassType.MEDIC:
			slot_img.texture = load("res://Images/Textures/Icons/Characters/Medic.png")
		CharData.ClassType.CLOWN:
			slot_img.texture = load("res://Images/Textures/Icons/Characters/Clown.png")
		CharData.ClassType.ARCANIST:
			slot_img.texture = load("res://Images/Textures/Icons/Characters/Arcanist.png")
		CharData.ClassType.DRUID:
			slot_img.texture = load("res://Images/Textures/Icons/Characters/Druid.png")
		CharData.ClassType.SWORDMASTER:
			slot_img.texture = load("res://Images/Textures/Icons/Characters/Swordmaster.png")
		CharData.ClassType.HORROR:
			slot_img.texture = load("res://Images/Textures/Icons/Characters/Horror.png")
		CharData.ClassType.WITCH:
			slot_img.texture = load("res://Images/Textures/Icons/Characters/Witch.png")

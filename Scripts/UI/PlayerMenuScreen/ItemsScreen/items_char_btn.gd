extends Control

@export var pos: int = 0

@onready var nam: Label = $HBox/VBox/Name
@onready var hp_bar: ProgressBar = $HBox/VBox/HPBar
@onready var hp_txt: Label = $HBox/VBox/HPBar/HPTxt
@onready var ap_bar: ProgressBar = $HBox/VBox/APBar
@onready var ap_txt: Label = $HBox/VBox/APBar/APTxt
@onready var img: TextureRect = $HBox/Img

var empty: bool = true

func setup():
	var c: CharData
	
	if pos <= PlayerData.party.size() - 1:
		c = PlayerData.party[pos]
		empty = false
	elif (PlayerData.reserve.size() > 0) && pos - 4  <= PlayerData.reserve.size() - 1:
		c = PlayerData.reserve[pos - 4]
		empty = false
	else:
		empty = true
		return
	
	nam.text = c.display_name
	hp_bar.value = (c.curHP / c.maxHP) * 100
	ap_bar.value = (c.curAP / c.maxAP) * 100
	hp_txt.text = "HP: " + str(c.maxHP) + "/" + str(c.curHP)
	ap_txt.text = "AP: " + str(c.maxAP) + "/" + str(c.curAP)
	img.texture = load("res://Images/Textures/Icons/Characters/" + CharData.ClassType.keys()[c.class_type].capitalize() + ".png")
	
func click():
	pass

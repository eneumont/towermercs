extends Control

var id

@onready var pic: TextureRect = $HBox/Pic
@onready var nam: Label = $HBox/Name
@onready var des: Label = $HBox/Des
@onready var number: Label = $HBox/Number

func setup():
	var item = ItemDatabase.get_item(id)
	pic.texture = load("res://Images/Textures/Icons/Items/" + item.pic)
	nam.text = item.name
	des.text = item.description
	number.text = str(PlayerData.inventory[id])
	
func click():
	pass

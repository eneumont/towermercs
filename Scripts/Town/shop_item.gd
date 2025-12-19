extends Button

var shop

var pic: Texture
var act_name: String
var display_name: String
var cost: int
var own: int
var flavor: String
var description: String

@onready var item_pic: TextureRect = $HBoxContainer/ItemPic
@onready var item_name: Label = $HBoxContainer/ItemName
@onready var item_cost: Label = $HBoxContainer/ItemCost
@onready var item_own: Label = $HBoxContainer/ItemOwn

func btn_setup():
	item_pic.texture = pic
	item_name.text = display_name
	item_cost.text = "cost: " + str(cost)
	item_own.text = "owned: " + str(own)

func click():
	shop.item_click(cost, act_name)

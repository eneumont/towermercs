extends Control
class_name BuildingUI

var ownerName: String
var ownerPic: Texture
var ownerDialogue: Dictionary
var ownerRespones: Dictionary

var building: Building

@export var ownerImg: TextureRect
@export var nameTxt: Label
@export var dialogTxt: Label
@export var moneyTxt: Label
@export var exitBtn: Button

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	pass

func setup():
	ownerImg.texture = ownerPic
	nameTxt.text = ownerName
	talk(false, "Begin")
	updateMoney()
	
func talk(dialog: bool, speak :String):
	dialogTxt.text = ownerDialogue[speak] if dialog else ownerRespones[speak]

func updateMoney():
	moneyTxt.text = "Money: $" + str(PlayerData.money)

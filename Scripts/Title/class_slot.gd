extends Node

var title

@export var type: CharData.ClassType
@export var slot: int

var done: bool = false
var c_name: String

@onready var name_input: LineEdit = $VBox/NameInput
@onready var class_txt: Label = $VBox/ClassTxt
@onready var class_img: TextureRect = $VBox/HBoxContainer/ClassImg
@onready var description_txt: Label = $VBox/DescriptionTxt

func _ready() -> void:
	class_setup()

func class_setup():
	match (type):
		CharData.ClassType.KNIGHT:
			setup("Knight", "Knight.png", "A warrior who fights with sword and shield to protect allies. Specializes in protecting and buffing the party.")
		CharData.ClassType.THIEF:
			setup("Thief", "Thief.png", "This crook makes up for a lack of might with nasty tricks. Specializes in debuffing the enemy.")
		CharData.ClassType.MAGE:
			setup("Mage", "Mage.png", "One who wishes to study artistry to its fullest. Specializes in high offensive magic.")
		CharData.ClassType.CLERIC:
			setup("Cleric", "Cleric.png", "Devotee of faith, using belief as power. Specializes in healing and buffing the party.")
		CharData.ClassType.ALCHEMIST:
			setup("Alchemist", "Alchemist.png", "")
		CharData.ClassType.BARD:
			setup("Bard", "Bard.png", "")
		CharData.ClassType.BRAWLER:
			setup("Brawler", "Brawler.png", "")
		CharData.ClassType.MEDIC:
			setup("Medic", "Medic.png", "")
		CharData.ClassType.CLOWN:
			setup("Clown", "Clown.png", "")
		CharData.ClassType.ARCANIST:
			setup("Arcanist", "Arcanist.png", "")
		CharData.ClassType.DRUID:
			setup("Druid", "Druid.png", "")
		CharData.ClassType.SWORDMASTER:
			setup("Swordmaster", "Swordmaster.png", "")
		CharData.ClassType.HORROR:
			setup("Horror", "Horror.png", "")
		CharData.ClassType.WITCH:
			setup("Witch", "Witch.png", "")

func setup(char_name: String, c_img: String, des: String):
	class_txt.text = char_name
	class_img.texture = load("res://Images/Textures/Icons/Characters/" + c_img)
	description_txt.text = des

func done_click():
	done = !done
	if done: 
		c_name = name_input.text
		PlayerData.party[slot] = CharData.new().make_base(c_name, type)

func class_scroll(num: int):
	var options = PlayerData.available_classes

	if (type + num) < 0:
		type = options[options.back()]
	elif (type + num) > options.size() - 1:
		type = options[0]
	else:
		type = type + num
	
	PlayerData.party[slot] = CharData.new().make_base(c_name, type)
	
	class_setup()

func left():
	class_scroll(-1)
	
func right():
	class_scroll(1)

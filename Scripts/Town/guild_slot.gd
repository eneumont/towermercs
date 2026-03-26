extends Button

var shop

var display_name: String
var type: CharData.ClassType
var level: int

@onready var name_input: LineEdit = $VBox/NameInput
@onready var class_txt: Label = $VBox/ClassTxt
@onready var class_img: TextureRect = $VBox/ClassImg
@onready var description_txt: Label = $VBox/DescriptionTxt
@onready var cost_txt: Label = $VBox/CostTxt

func setup(c_type: CharData.ClassType):
	match c_type:
		CharData.ClassType.KNIGHT:
			make("Knight", "Knight.png", "A warrior who fights with sword and shield to protect allies. Specializes in protecting and buffing the party.", 100 if shop.hireMode else 50 * level)
		CharData.ClassType.THIEF:
			make("Thief", "Thief.png", "This crook makes up for a lack of might with nasty tricks. Specializes in debuffing the enemy.", 100 if shop.hireMode else 50 * level)
		CharData.ClassType.MAGE:
			make("Mage", "Mage.png", "One who wishes to study artistry to its fullest. Specializes in high offensive magic.", 100 if shop.hireMode else 50 * level)
		CharData.ClassType.CLERIC:
			make("Cleric", "Cleric.png", "Devotee of faith, using belief as power. Specializes in healing and buffing the party.", 100 if shop.hireMode else 50 * level)
		CharData.ClassType.ALCHEMIST:
			make("Alchemist", "Alchemist.png", "", 100 if shop.hireMode else 50 * level)
		CharData.ClassType.BARD:
			make("Bard", "Bard.png", "", 100 if shop.hireMode else 50 * level)
		CharData.ClassType.BRAWLER:
			make("Brawler", "Brawler.png", "", 100 if shop.hireMode else 50 * level)
		CharData.ClassType.MEDIC:
			make("Medic", "Medic.png", "", 100 if shop.hireMode else 50 * level)
		CharData.ClassType.CLOWN:
			make("Clown", "Clown.png", "", 100 if shop.hireMode else 50 * level)
		CharData.ClassType.ARCANIST:
			make("Arcanist", "Arcanist.png", "", 200 if shop.hireMode else 100 * level)
		CharData.ClassType.SWORDMASTER:
			make("Swordmaster", "Swordmaster.png", "", 200 if shop.hireMode else 100 * level)
		CharData.ClassType.WITCH:
			make("Witch", "Witch.png", "", 300 if shop.hireMode else 200 * level)
		CharData.ClassType.DRUID:
			make("Druid", "Druid.png", "", 200 if shop.hireMode else 100 * level)
		CharData.ClassType.HORROR:
			make("Horror", "Horror.png", "", 200 if shop.hireMode else 100 * level)

func make(c_txt: String, c_img: String, d_txt: String, cost: int):
	class_txt.text = c_txt
	class_img.texture = load("res://Images/Textures/Icons/Characters/" + c_img)
	description_txt.text = d_txt
	cost_txt.text = "$" + str(cost)

func btn_up():
	if shop.hireMode:
		if (PlayerData.money - cost_txt.text.to_int()) < 0:
			pass
		else:
			PlayerData.money -= cost_txt.text.to_int()
			PlayerData.collection.append(CharData.new(display_name, type))
	else: 
		PlayerData.money += cost_txt.text.to_int()
	
		var index: int
	
		for c in PlayerData.collection:
			if c.act_name == display_name: #actual name?
				index = PlayerData.collection.find(c)
				PlayerData.collection.remove_at(index)
				queue_free()
				break
		
	shop.updateMoney()

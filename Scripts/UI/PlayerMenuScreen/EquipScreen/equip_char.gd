extends Control

@export var screen: Control
@export var pos: int = 0
var c_data: CharData

func setup():
	c_data = PlayerData.party[pos] if pos <= 3 else PlayerData.reserve[pos - 4]
	
	$Slot/HBox/NameTxt.text = c_data.display_name
	$Slot/HBox/CharPic.texture = load("res://Images/Textures/Icons/Characters/" + CharData.ClassType.keys()[c_data.class_type] + ".png")
	equip_btns()

func equip_btns():
	var wp := $Slot/EquipBox/WpBtn
	var ar := $Slot/EquipBox/ArBtn
	var ac := $Slot/EquipBox/AcBtn
	
	var equip := ItemDatabase.get_item(c_data.equipment[ItemRes.ItemType.WEAPON])
	wp.id = equip.id if equip != null else ""
	wp.setup()
	
	equip = ItemDatabase.get_item(c_data.equipment[ItemRes.ItemType.ARMOR])
	ar.id = equip.id if equip != null else ""
	ar.setup()
	
	equip = ItemDatabase.get_item(c_data.equipment[ItemRes.ItemType.ACCESSORY])
	ac.id = equip.id if equip != null else ""
	ac.setup()

func equip_click():
	#.equip_list(true, ItemDatabase.get_item(id).item_type)
	pass

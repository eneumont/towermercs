extends Control

@export var scr: int 

var party_pos: int #for char pos in party/reserve 0-3/4,5

var item_itemBtn: PackedScene = preload("res://Scenes/UI/PlayerMenu/items_item_btn.tscn")
var item_list: String = "All"

var equip_equipBtn: PackedScene = preload("res://Scenes/UI/PlayerMenu/equip_equip_btn.tscn")

## 0 - MAIN, 1 - ITEMS, 2 - ARTS, 3 - Equip, 4 - Tactics, 5 - Quests, 6 - SETTINGS, 7 - Tree, 8 - CHAR
func design():
	match scr:
		0:
			main_design()
		1:
			item_design()
		2:
			art_design()
		3:
			equip_design()
		4:
			tactic_design()
		5:
			quest_design()
		6:
			settings_design()
		7:
			tree_design()
		8:
			char_design()

func main_design():
	for i in range(1, 7):
		get_node_or_null("Button" + str(i)).design()
	
	get_node_or_null("TimeTxt").text = "Time: " + PlayerData.time
	get_node_or_null("MoneyTxt").text = "Money: " + str(PlayerData.money)

func item_design():
	list_items()
	
	for i in range(1, 7):
		get_node_or_null("Main/CharBox/CharBtn" + str(i)).setup()

func list_items():
	for child in get_node_or_null("Main/ScrollBox/ItemsBox").get_children():
		child.queue_free()
	
	for i in PlayerData.inventory.keys():
		var new_item = item_itemBtn.instantiate()
		match item_list:
			"Use":
				if ItemDatabase.get_item(i).item_type != ItemRes.ItemType.CONSUMABLE: continue
			"Battle":
				if ItemDatabase.get_item(i).item_type != ItemRes.ItemType.BATTLE: continue
			"Weapon":
				if ItemDatabase.get_item(i).item_type != ItemRes.ItemType.WEAPON: continue
			"Armor":
				if ItemDatabase.get_item(i).item_type != ItemRes.ItemType.ARMOR: continue
			"Accessory":
				if ItemDatabase.get_item(i).item_type != ItemRes.ItemType.ACCESSORY: continue
			"Key":
				if ItemDatabase.get_item(i).item_type != ItemRes.ItemType.KEY: continue
		
		get_node_or_null("Main/ScrollBox/ItemsBox").add_child(new_item)
		new_item.id = i
		new_item.setup()

func art_design():
	pass

func equip_design():
	equip_party()
	equip_list()

func equip_party():
	for i in range(1, PlayerData.party.size() + PlayerData.reserve.size() + 1):
		get_node("Main/CharBox/CharRow" + str(i if i % 2 != 0 else i - 1) + "/CharSlot" + str(i)).setup()

func equip_list(show: bool = false, type: ItemRes.ItemType = ItemRes.ItemType.WEAPON, id: String = ""):
	get_node("Main/EquipBox").visible = show
	if show:
		get_node("Main/EquipBox/EquipBtn").id = id
		get_node("Main/EquipBox/EquipBtn").setup()
		
		for i in get_node("Main/EquipBox/EquipScroll/VBox").get_children():
			i.queue_free()
		
		for i in PlayerData.inventory:
			if ItemDatabase.get_item(i).item_type == type:
				for j in PlayerData.inventory[i]:
					var new_equip = equip_equipBtn.instantiate()
					get_node("Main/EquipBox/EquipScroll/VBox").add_child(new_equip)
					new_equip.size_flags_vertical = Control.SIZE_FILL
					new_equip.custom_minimum_size = Vector2(0, 127)
					new_equip.id = i
					new_equip.setup() 
					#add thing for who wearing said equipment if any (wait weren't gonna remove and add for equipment?... fuck I'm good, prob will need things like shops to check party equipment too etc...)

func tactic_design():
	pass

func quest_design():
	pass

func settings_design():
	pass

func tree_design():
	pass

func char_design():
	party_pos #do something with this

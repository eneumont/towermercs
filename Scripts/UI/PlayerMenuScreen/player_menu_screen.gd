extends Control

@export var scr: int 

var party_pos: int #for char pos in party/reserve 0-3/4,5

var item_itemBtn: PackedScene = preload("res://Scenes/UI/PlayerMenu/items_item_btn.tscn")

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
	for child in get_node_or_null("Main/ScrollBox/ItemsBox").get_children():
		child.queue_free()
	
	for i in PlayerData.inventory.keys():
		var new_item = item_itemBtn.instantiate()
		get_node_or_null("Main/ScrollBox/ItemsBox").add_child(new_item)
		new_item.id = i
		new_item.setup()
		
	for i in range(1, 7):
		get_node_or_null("Main/CharBox/CharBtn" + str(i)).setup()

func art_design():
	pass

func equip_design():
	pass

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

extends Control

@export var scr: int 

var party_pos: int #for char pos in party/reserve 0-3/4,5

## 0 - MAIN, 1 - ITEMS, 2 - ARTS, - SETTINGS, 9 - CHAR
func design():
	match scr:
		0:
			main_design()
		1:
			item_design()
		2:
			art_design()
		9:
			char_design()

func main_design():
	for i in range(1, 7):
		get_node_or_null("Button" + str(i)).design()
	
	get_node_or_null("TimeTxt").text = "Time: " + PlayerData.time
	get_node_or_null("MoneyTxt").text = "Money: " + str(PlayerData.money)

func item_design():
	pass

func art_design():
	pass

func settings_design():
	pass

func char_design():
	party_pos #do something with this

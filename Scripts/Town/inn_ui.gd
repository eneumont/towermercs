extends BuildingUI

var rest_mode: bool = false

@onready var save_ui: Panel = $MainUI/SaveUI
@onready var rest_ui: Panel = $MainUI/RestUI
@onready var cost_txt: Label = $MainUI/RestUI/VBox/InfoBar/CostTxt

var cost: int

func setup():
	super()
	shop_setup()

func shop_setup():	
	if rest_mode: rest_set()
	else: save_set()
	
	save_ui.visible = !rest_mode
	rest_ui.visible = rest_mode
	
	updateMoney()

func save_set():
	for slot in save_ui.get_child(0).get_children():
		slot.setup()

func rest_set():
	for slot in rest_ui.get_child(0).get_child(0).get_children():
		slot.setup()
	
	cost = ((PlayerData.party[0].maxHP - PlayerData.party[0].curHP) + (PlayerData.party[1].maxHP - PlayerData.party[1].curHP) + (PlayerData.party[2].maxHP - PlayerData.party[2].curHP) + (PlayerData.party[3].maxHP - PlayerData.party[3].curHP)) * 10
	cost_txt.txt = "Cost: " + str(cost)
	
func heal_click():
	if not cost > PlayerData.money:
		PlayerData.money -= cost
		updateMoney()
		rest_set()

func saving_click(slot: int):
	SaveManager.save_game(slot, PlayerData.save())
	save_set()

func save_click():
	rest_mode = false
	shop_setup()

func rest_click():
	rest_mode = true
	shop_setup()

func _on_exit_btn_button_up() -> void:
	building.closeUI()

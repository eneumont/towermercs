extends BuildingUI

var rest_mode: bool = false

@onready var save_ui: Panel = $MainUI/SaveUI
@onready var rest_ui: Panel = $MainUI/RestUI
@onready var cost_txt: Label = $MainUI/RestUI/VBox/InfoBar/CostTxt

var cost: int

@export var cost_mul: int = 1

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
	cost = 0
	
	for slot in rest_ui.get_child(0).get_child(0).get_children():
		slot.ui = self
		slot.cost_mult = cost_mul
		slot.setup()
		cost += slot.cost
	
	cost_txt.text = "Cost: " + str(cost)

func heal_click():
	if not cost > PlayerData.money:
		PlayerData.money -= cost
		updateMoney()
		
		for p in PlayerData.party:
			p.curHP = p.maxHP
			p.curAP = p.maxAP
		
		rest_set()
	else:
		talk(false, "Broke")

func save_click():
	rest_mode = false
	shop_setup()
	talk(false, "Save")

func rest_click():
	rest_mode = true
	shop_setup()
	talk(false, "Rest")

func _on_exit_btn_button_up() -> void:
	building.closeUI()

extends BuildingUI

var hireMode: bool = true

var slot_scn: PackedScene = preload("res://Scenes/UI/GuildSlot.tscn")

var classes: Array = []

@onready var items_box: HBoxContainer = $MainUI/ScrollContainer/ItemsBox

func setup():
	super()
	classes = PlayerData.available_classes
	shop_setup()

func shop_setup():
	for child in items_box.get_children():
		child.queue_free()
	
	var slots = classes if hireMode else PlayerData.collection
	for s in slots:
		var new_slot = slot_scn.instantiate()
		items_box.add_child(new_slot)
		if !hireMode: new_slot.level = s.cur_level
		new_slot.shop = self
		new_slot.setup(s if hireMode else s.class_type)
	
	updateMoney()

func hire_click():
	hireMode = true
	shop_setup()
	
func fire_click():
	hireMode = false
	shop_setup()

func _on_exit_btn_button_up() -> void:
	building.closeUI()

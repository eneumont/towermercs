extends BuildingUI

var buymode: bool = true

var item_scn: PackedScene = preload("res://Scenes/UI/ShopSlot.tscn")

@export var shop_inventory: Array[String]

@onready var items_container: VBoxContainer = $MainUI/ScrollContainer/ItemsContainer

func setup():
	super()
	shop_setup()
	
func shop_setup():
	for child in items_container.get_children():
		child.queue_free()
	
	var ui_items = shop_inventory if buymode else PlayerData.inventory.keys()
	
	for item in ui_items:
		var data = ItemDatabase.get_item(item)
		var new_item = item_scn.instantiate()
		items_container.add_child(new_item)
		new_item.pic = load("res://Images/Textures/Icons/Items/" + data.pic)
		new_item.act_name = data.id
		new_item.display_name = data.name
		new_item.own = PlayerData.inventory[data.id] if PlayerData.inventory.has(data.id) else 0
		new_item.cost = str(data.buyCost) if buymode else str(data.sellCost)
		new_item.description = data.description
		new_item.flavor = data.flavor
		new_item.shop = self
		new_item.btn_setup()
	
	updateMoney()

func buy_click():
	buymode = true
	shop_setup()
	
func sell_click():
	buymode = false
	shop_setup()

func item_click(cost: int, id: String):
	if buymode: buy(cost, id)
	else: sell(cost, id)

func buy(cost: int, id: String):
	if (PlayerData.money - cost) < 0:
		talk(false, "Broke") 
	elif PlayerData.inventory.has(id) && (PlayerData.inventory[id] + 1) > 99:
		talk(false, "Too Much")
	else:
		PlayerData.money -= cost
		if !PlayerData.inventory.has(id): PlayerData.inventory[id] = 0
		PlayerData.inventory[id] += 1 
		shop_setup()
		talk(false, "Buy")
	
func sell(cost: int, id: String):
	PlayerData.money += cost
	if PlayerData.inventory[id] - 1 == 0: PlayerData.inventory.erase(id)
	else: PlayerData.inventory[id] -= 1
	shop_setup()
	talk(false, "Sell")

func _on_exit_btn_button_up() -> void:
	building.closeUI()

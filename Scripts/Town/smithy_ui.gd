extends BuildingUI

enum ShopMode {
	ALL,
	WEAPON,
	ARMOR,
	ACCESSORY,
}

var mode: ShopMode = ShopMode.ALL

var item_scn: PackedScene = preload("res://Scenes/UI/ShopSlot.tscn")

var shop_inventory: Array[String]
@export var weapon_inventory: Array[String]
@export var armor_inventory: Array[String]
@export var accessory_inventory: Array[String]

@onready var items_container: VBoxContainer = $MainUI/ScrollContainer/ItemsContainer

func setup():
	super()
	shop_inventory = weapon_inventory + armor_inventory + accessory_inventory
	shop_setup()
	
func shop_setup():
	for child in items_container.get_children():
		child.queue_free()
	
	var ui_items
	
	match mode:
		ShopMode.ALL:
			ui_items = shop_inventory
		ShopMode.WEAPON:
			ui_items = weapon_inventory
		ShopMode.ARMOR:
			ui_items = armor_inventory
		ShopMode.ACCESSORY:
			ui_items = accessory_inventory
	
	for item in ui_items:
		var data = ItemDatabase.get_item(item)
		var new_item = item_scn.instantiate()
		items_container.add_child(new_item)
		new_item.pic = load("res://Images/Textures/Icons/Items/" + data.pic)
		new_item.act_name = data.id
		new_item.display_name = data.name
		new_item.own = data.owned
		new_item.cost = str(data.buyCost)
		new_item.description = data.description
		new_item.flavor = data.flavor
		new_item.shop = self
		new_item.btn_setup()
	
	updateMoney()

func all_click():
	mode = ShopMode.ALL
	shop_setup()
	
func weapon_click():
	mode = ShopMode.WEAPON
	shop_setup()

func armor_click():
	mode = ShopMode.ARMOR
	shop_setup()
	
func accessory_click():
	mode = ShopMode.ACCESSORY
	shop_setup()

func item_click(cost: int, id: String):
	buy(cost, id)

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

func _on_exit_btn_button_up() -> void:
	building.closeUI()

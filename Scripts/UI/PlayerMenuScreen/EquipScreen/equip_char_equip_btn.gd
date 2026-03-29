extends Button #this one could instead be decided by equip_char

@export var screen: Control

var id: String

func click():
	screen.equip_list(true, ItemDatabase.get_item(id).item_type, id)

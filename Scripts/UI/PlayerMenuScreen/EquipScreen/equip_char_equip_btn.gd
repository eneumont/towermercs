extends Button #this one could instead be decided by equip_char

@export var screen: Control

var id: String

func setup():
	text = ItemDatabase.get_item(id).name if !id.is_empty() else ""

func click():
	if !id.is_empty(): screen.equip_list(true, ItemDatabase.get_item(id).item_type, id)

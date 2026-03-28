extends Control

@export var screen: Control
@export var list: String = ""

func click():
	screen.item_list = list
	screen.list_items()

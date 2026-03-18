extends Control

@export var menu: Control

## 0 - MAIN, 1 - ITEMS, 2 - ARTS, - SETTINGS, 9 - CHAR
@export var menu_num: int = 0

func menu_click():
	menu.change_scr(menu_num)

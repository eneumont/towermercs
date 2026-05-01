extends Control

@export var menu: Control

## 0 - MAIN, 1 - ITEMS, 2 - ARTS, 3 - Equip, 4 - Tactics, 5 - Quests, 6 - SETTINGS, 7 - Tree, 8 - CHAR
@export var menu_num: int = 0

func menu_click():
	menu.change_scr(menu_num)

func title_click():
	PlayerData.reset()
	get_tree().change_scene_to_file("res://Scenes/Title/TitleUI.tscn")

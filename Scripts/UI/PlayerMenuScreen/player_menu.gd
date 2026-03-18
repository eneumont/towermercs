extends Control

const MAX_SCREEN: int = 0
const MIN_SCREEN: int = 1

var cur_scr: int = MIN_SCREEN
var player

@onready var screens: Array = [
	$MainMenu,
	$ItemMenu,
	$CharMenu,
]

func _ready() -> void:
	change_scr(0)

## 0 - MAIN, 1 - ITEMS, 2 - ARTS, - SETTINGS, 9 - CHAR [br]
##  scr - for instant change, change - for next, pos - for party/reserve pos
func change_scr(scr: int = 0, change: int = 0, pos: int = -1):
	screens[cur_scr].visible = false
	
	if change != 0:
		cur_scr += change
		if cur_scr > MAX_SCREEN: cur_scr = MIN_SCREEN
		if cur_scr < MIN_SCREEN: cur_scr = MAX_SCREEN
	else:
		cur_scr = scr
	
	screens[cur_scr].visible = true
	if pos > -1: screens[cur_scr].party_pos = pos
	screens[cur_scr].design()

func exit_click():
	player.ui_show()

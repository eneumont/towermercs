extends Control

#dictionary would be better here
@onready var screens: Array[Panel] = [
	$TitleScreen,
	$PlayScreen,
	$SaveScreen,
	$MultiScreen,
	$OptionsScreen,
	$ModeScreen,
	$PartyScreen,
]

var solo: bool = true
var story: bool = true
var delete: bool = false

func _ready() -> void:
	for b in $SaveScreen/SavesBox.get_children():
		b.title_ui = self
	
	title_screen()

func play_screen():
	pick_screen(1)
	
func options_screen():
	pick_screen(4)
	
func quit():
	get_tree().quit()

func title_screen():
	pick_screen(0)
	
func save_screen():
	pick_screen(2)
	
func multi_screen():
	solo = false
	pick_screen(3)
	
func mode_screen():
	pick_screen(5)

func solo_click():
	solo = true
	save_screen()

func new_click():
	pick_screen(6)

func delete_click():
	delete = !delete

func pick_save():
	#will be used by title save slot to set stuff
	mode_screen()

func party_done():
	for slot in $PartyScreen/PartyBox.get_children():
		if not (slot.done): return
	
	#do stuff then start story mode
	story_click()

func story_click():
	get_tree().change_scene_to_file("res://Scenes/" + PlayerData.cur_scn)
	
func arena_click():
	#get_tree().change_scene_to_file("res://Scenes/" + "Arena/ArenaBase" + ".tscn")
	pass

func pick_screen(num: int):
	for i in range(screens.size()):
		if (i == num):
			screens[i].visible = true 
		else:
			screens[i].visible = false

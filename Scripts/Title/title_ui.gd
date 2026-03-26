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
	PlayerData.party = [
		CharData.new("Test1", CharData.ClassType.MAGE),
		CharData.new("Test2", CharData.ClassType.THIEF),
		CharData.new("Test3", CharData.ClassType.KNIGHT),
		CharData.new("Test4", CharData.ClassType.CLERIC),
	]
	#PlayerData.reserve = [
		#CharData.new("Test5", CharData.ClassType.CLERIC),
		#CharData.new("Test6", CharData.ClassType.THIEF),
	#]
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
	SceneManager.new_scene(PlayerData.cur_scn, PlayerData.player_pos)
	
func arena_click():
	#SceneManager.new_scene("Arena/ArenaBase", Vector3(0,0,0)
	pass

func pick_screen(num: int):
	for i in range(screens.size()):
		if (i == num):
			screens[i].visible = true 
		else:
			screens[i].visible = false

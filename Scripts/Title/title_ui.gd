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
	$CoopScreen,
]
#some screens will probably need a more specific back func

@onready var online_slot: PackedScene = preload("res://Scenes/Title/OnlineSlot.tscn")

var solo := true
var coop := false
var online := false
var player_count := 1
var players := {
		"Player1" : -1,
		"Player2" : -1,
		"Player3" : -1,
		"Player4" : -1,
	}
var story: bool = true
var delete: bool = false

func _ready() -> void:
	for b in $SaveScreen/SavesBox.get_children():
		b.title_ui = self
	
	title_screen()

func _input(event: InputEvent) -> void:
	#should prob do some disconnect checks
	#check for other couch coop options
	if not coop and event is InputEventJoypadButton:
		for player in players:
			if players[player] == -1:
				players[player] = event.device
				player_count += 1
				break

func play_screen():
	solo = true
	coop = false
	online = false
	PlayerData.solo = true
	PlayerData.coop = false
	PlayerData.online = false
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
	online = true
	
	online_refresh()
	pick_screen(3)

func online_refresh():
	for c in $MultiScreen/VBox/ScrollBox/VBox.get_children():
		c.queue_free()
		
	#create children based on online stuff...
	#for o in online:
	#	var new_slot = online_slot.instantiate()
	#	new_slot.get_node("SlotName").text = ""
	#	new_slot.get_node("SlotCount").text = ""
	#	#other setup
	#	$MultiScreen/VBox/ScrollBox/VBox.add_child(new_slot)

func coop_screen():
	player_count = 0
	players = {
		"Player1" : -1,
		"Player2" : -1,
		"Player3" : -1,
		"Player4" : -1,
	}
	coop = true
	solo = false
	pick_screen(7)

func coop_ready():
	#get all player devices/controllers/etc...
	if player_count > 1:
		PlayerData.coop = true
		save_screen()

func update_coop():
	pass

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
	delete = false
	pick_screen(6)

func delete_click():
	delete = !delete

func pick_save():
	delete = false
	mode_screen()

func party_done():
	for slot in $PartyScreen/PartyBox.get_children():
		if not (slot.done): return
	
	#do stuff then start story mode
	delete = false
	mode_screen()

func story_click():
	SceneManager.new_scene(PlayerData.cur_scn, PlayerData.player_pos)
	
func arena_click(): #figure how arena works
	#SceneManager.new_arena("Arena/ArenaBase", Vector3(0,0,0)
	pass

func pick_screen(num: int):
	for i in range(screens.size()):
		screens[i].visible = (i == num)

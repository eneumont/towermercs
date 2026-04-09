extends Control

@export var party_slots: Array[Control]
@export var turnOrder: Control

@onready var fb = $Feedback
@onready var result = $ResultUI

func set_bm(b: Node3D):
	turnOrder.bm = b
	
	for p in party_slots:
		p.bm = b

func set_turns():
	turnOrder.update_both()

func set_party():
	for p in party_slots:
		p.update_self()

func feed(f: String):
	fb.visible = true
	fb.text = f
	await get_tree().create_timer(3.0).timeout
	fb.visible = false

func end(win: bool):
	turnOrder.visible = false
	for p in party_slots:
		p.visible = false
	
	result.visible = true
	
	var scr
	if win:
		scr = result.get_node("PlayerScr")
		scr.visible = true
		scr.get_node("ContinueBtn").connect("button_up", continue_click)
		#give rewards
	else:
		scr = result.get_node("EnemyScr")
		scr.visible = true
		scr.get_node("Result/VBox/SaveBtn").connect("button_up", save_click)
		scr.get_node("Result/VBox/TitleBtn").connect("button_up", title_click)

func continue_click():
	SceneManager.leave_battle()

func save_click():
	SceneManager.empty()
	var out := SaveManager.recent.split(" ")
	SaveManager.load_game(int(out[0]), out[1] == "true")
	SceneManager.new_scene(PlayerData.cur_scn, PlayerData.player_pos)
	
func title_click():
	SceneManager.empty()
	PlayerData.reset()
	get_tree().change_scene_to_file("res://Scenes/Title/TitleUI.tscn")

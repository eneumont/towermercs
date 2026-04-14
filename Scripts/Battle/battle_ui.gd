extends Control

@export var party_slots: Array[Control]

@onready var turnOrder = $TurnOrderUI
@onready var fb = $Feedback
@onready var result = $ResultUI

var money_won: int= 0
var exp_won: int = 0
var sp_won: int = 0

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
		#give rewards, gonna have little animation for this, bar filling, etc...
		scr.get_node("Result/RewardBox/MoneyTxt").text = "Money: " + str(money_won)
		scr.get_node("Result/RewardBox/ExpTxt").text = "Exp: " + str(exp_won)
		scr.get_node("Result/RewardBox/SpTxt").text = "Sp: " + str(sp_won)
		
		
		
		PlayerData.money += money_won
		for p in PlayerData.party:
			p.gain_rewards(exp_won, sp_won)
		for p in PlayerData.reserve:
			p.gain_rewards(float(exp_won * 0.7), float(sp_won * 0.7)) #or could do same rate...
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

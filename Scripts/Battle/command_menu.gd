extends Control

var bm
var flip: bool = false

@onready var attack_btn: Button = $Panel1/VBox/AttackBtn
@onready var defend_btn: Button = $Panel1/VBox/DefendBtn
@onready var arts_btn: Button = $Panel1/VBox/ArtsBtn
@onready var items_btn: Button = $Panel1/VBox/ItemsBtn

#controls 
#square attack/swap
#triangle arts/status
#circle defend/run
#cross items/analyse
#right bumper flip

func key_click(k: String):
	match k:
		"square":
			swap_click() if flip else attack_click()
		"circle":
			run_click() if flip else defend_click()
		"triangle":
			status_click() if flip else arts_click()
		"cross":
			analyse_click() if flip else items_click()
		"left_bump":
			pass
		"right_bump":
			flip_click()
	
func attack_click():
	#bm.casted_art = bm.cur_turn.artthing[0] if bm.casted_art.is_empty() else ""
	bm.casted_art = "test_attack" if bm.casted_art.is_empty() else ""
	
func defend_click():
	#bm.casted_art = bm.cur_turn.artthing[0] if bm.casted_art.is_empty() else ""
	bm.casted_art = "test_defend" if bm.casted_art.is_empty() else ""
	
func arts_click():
	pass
	
func items_click():
	pass
	
func swap_click():
	pass
	
func run_click():
	#bm.casted_art = bm.cur_turn.artthing[0] if bm.casted_art.is_empty() else ""
	pass
	
func status_click():
	pass
	
func analyse_click():
	pass
	
func flip_click():
	flip = !flip
	attack_btn.text = "Swap (J)" if flip else "Attack (J)"
	defend_btn.text = "Run (L)" if flip else "Defend (L)"
	arts_btn.text = "Status (I)" if flip else "Arts (I)"
	items_btn.text = "Analyse (K)" if flip else "Items (K)"

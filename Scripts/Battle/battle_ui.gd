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
	result.visible = true
	
	if win:
		result.get_node("PlayerScr").visible = true
	else:
		result.get_node("EnemyScr").visible = true

func continue_click():
	pass

func save_click():
	pass
	
func title_click():
	pass

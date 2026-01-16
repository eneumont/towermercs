extends Control

@export var party_slots: Array[Control]
@export var turnOrder: Control

var feedback: String

func set_bm(b: Node3D):
	turnOrder.bm = b

func set_turns():
	turnOrder.update_both()
	
func set_party():
	for p in party_slots:
		p.update_self()

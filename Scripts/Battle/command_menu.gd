extends Control

var bm
var flip: bool = false

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
	bm.casted_art = "test_attack" if bm.casted_art.is_empty() else ""
	
func defend_click():
	bm.casted_art = "test_defend" if bm.casted_art.is_empty() else ""
	
func arts_click():
	pass
	
func items_click():
	pass
	
func swap_click():
	pass
	
func run_click():
	pass
	
func status_click():
	pass
	
func analyse_click():
	pass
	
func flip_click():
	flip = !flip

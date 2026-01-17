extends Control

var bm

func attack_click():
	if bm.casted_art.empty():
		bm.casted_art = "test_attack"
	else:
		bm.casted_art = ""
	
func defend_click():
	if bm.casted_art.empty():
		bm.casted_art = "test_defend"
	else:
		bm.casted_art = ""
	
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
	pass

extends Control

#in x by 55
var turnStartPos: Vector2 = Vector2(5, 20)
var newTurnStartPos: Vector2 = Vector2(600, 20)
var turnImg = preload("res://Scenes/Battle/UI/TurnImg.tscn")
var bm

func update_both():
	update_cur()
	update_next()
	
func update_cur():
	for i in bm.cur_turnOrder.size():
		var img = turnImg.instantiate()
		$Background.add_child(img)
	
func update_next():
	for i in bm.next_turnOrder.size():
		var img = turnImg.instantiate()
		$Background.add_child(img)

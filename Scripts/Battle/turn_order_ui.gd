extends Control

#in x by 55
var turnImg = preload("res://Scenes/Battle/UI/TurnImg.tscn")
var bm

@onready var cr = $Background/Cur
@onready var nx = $Background/Next

func update_both():
	update_cur()
	update_next()
	
func update_cur():
	#iffy bout this
	for i in cr.get_children():
		cr.remove_child(i)
		i.queue_free()
	
	create_order(bm.cur_turnOrder, 5, cr)
	
func update_next():
	#iffy bout this
	for i in nx.get_children():
		nx.remove_child(i)
		i.queue_free()
	
	create_order(bm.cur_turnOrder, 600, nx)

func create_order(order: Array, startI: int, pl: Panel):
	for i in order.size():
		var img = turnImg.instantiate()
		img.position = Vector2(startI + (55 * i), 20)
		img.texture = load("res://Images/Textures/Icons/Characters/PlayerTurn.png") if order[i].team == Battler.Team.ALLY else load("res://Images/Textures/Icons/Characters/EnemyTurn.png")
		img.get_child(0).text = order[i].displayName
		pl.add_child(img)

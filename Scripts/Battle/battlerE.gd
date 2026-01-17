extends Battler
class_name BattlerE

func start_turn():
	super()

func end_turn():
	super()

func show_select():
	selector.visible = true

func hide_select():
	selector.visible = false

func clicked(cam: Node, evt: InputEvent, pos: Vector3, nor: Vector3, shape: int):
	if Input.is_action_just_released("l_click"):
		if not bm.casted_art.empty(): #prob add lot of checks here...
			var art := ArtDatabase.get_art(bm.casted_art)
			bm.targets += self
			bm.cast()

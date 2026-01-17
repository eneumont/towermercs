extends Battler
class_name BattlerP

var curAP: int
var maxAP: int

func start_turn():
	super()

func end_turn():
	super()

func show_select():
	selector.visible = true

func hide_select():
	selector.visible = false

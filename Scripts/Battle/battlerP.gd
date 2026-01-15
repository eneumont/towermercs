extends Battler
class_name BattlerP

var curAP: int
var maxAP: int

func start_turn():
	super()
	print("My turn started...")
	end_turn()

func end_turn():
	print("I end my turn...")
	super()

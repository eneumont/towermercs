extends Battler
class_name BattlerE

func start_turn():
	super()
	print("I did my turn!")
	end_turn()

func end_turn():
	print("Thats it for now!")
	super()

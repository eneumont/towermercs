extends Battler
class_name BattlerP

var curAP: int
var maxAP: int

@onready var command = $Sprite3D2

func _ready() -> void:
	command.get_child(0).get_child(0).bm = bm

func start_turn():
	super()
	command.visible = true

func end_turn():
	super()
	command.visible = false

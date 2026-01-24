extends Battler
class_name BattlerP

var curAP: int
var maxAP: int

@onready var command = $Sprite3D2
@onready var cm: Control = $Sprite3D2/SubViewport/CommandMenu

func _ready() -> void:
	cm.bm = bm

func start_turn():
	super()
	command.visible = true

func end_turn():
	super()
	cm.flip = false
	command.visible = false

func _process(delta: float) -> void:
	if command.visible:
		#research more to see if can do match
		if (Input.is_action_just_released("square")):
			cm.key_click("square")
		elif (Input.is_action_just_released("circle")):
			cm.key_click("circle")
		elif (Input.is_action_just_released("cross")):
			cm.key_click("cross")
		elif Input.is_action_just_released("triangle"):
			cm.key_click("triangle")
		elif (Input.is_action_just_released("left_bumper")):
			cm.key_click("left_bump")
		elif (Input.is_action_just_released("right_bumper")):
			cm.key_click("right_bump")

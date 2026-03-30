extends Battler
class_name BattlerP

var growths: Dictionary = {
	CharData.StatType.HEALTH : 50.0,
	CharData.StatType.ARTISTRY : 50.0,
	CharData.StatType.ATTACK : 50.0,
	CharData.StatType.MAGIC : 50.0,
	CharData.StatType.DEFENSE : 50.0,
	CharData.StatType.RESISTANCE : 50.0,
	CharData.StatType.SPEED : 50.0,
}

var curAP: int
var maxAP: int

var classType: CharData.ClassType

@onready var command = $Sprite3D2
@onready var cm: Control = $Sprite3D2/SubViewport/CommandMenu
@onready var anim_sprite: AnimatedSprite3D = $AnimatedSprite3D

func create(is_player: bool, c_data: CharData = null, f_data: EnemyData = null, control: Controller = Controller.PLAYER1) -> void:
	super(is_player, c_data, f_data, control)
	classType = c_data.class_type
	curAP = c_data.curAP * modifiers[CharData.StatType.ARTISTRY]
	maxAP = c_data.maxAP * modifiers[CharData.StatType.ARTISTRY]

func set_cur_stats():
	super()
	curAP = curAP/maxAP * currentStats[CharData.StatType.ARTISTRY]
	maxAP = currentStats[CharData.StatType.ARTISTRY]

func _ready() -> void:
	cm.bm = bm
	
	set_sprites()

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

func set_sprites(anim := "idle"):
	anim_sprite.sprite_frames = load("res://Images/Sprites/Battle/" + CharData.ClassType.keys()[classType].to_lower() + "_battle.tres")
	anim_sprite.play(anim)

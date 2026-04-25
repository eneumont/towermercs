extends Battler
class_name BattlerP

var stat_growths: Dictionary = {
	1 : [],
	2 : [],
	3 : [],
	4 : [],
	5 : [],
}
var maxExp: int

var curAP: int
var maxAP: int

var classType: CharData.ClassType

var origin_pos: Vector3

@onready var command = $Sprite3D2
@onready var cm: Control = $Sprite3D2/SubViewport/CommandMenu
@onready var anim_sprite: AnimatedSprite3D = $AnimatedSprite3D

func create(is_player: bool, data, control: Controller = Controller.PLAYER1) -> void:
	classType = data.class_type
	curAP = data.curAP
	maxAP = data.maxAP
	maxExp = data.max_exp
	stat_growths = data.stat_growths
	super(is_player, data, control)

func set_cur_stats():
	super()
	curAP = float(curAP)/maxAP * currentStats[CharData.StatType.ARTISTRY]
	maxAP = currentStats[CharData.StatType.ARTISTRY]

func _ready() -> void:
	cm.bm = bm
	
	set_sprites()

func start_turn():
	super()
	command.visible = true

func end_turn():
	create_tween().tween_property(self, "global_position", origin_pos, 1)
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

func battler_to_char() -> CharData:
	return CharData.new("", 0 as CharData.ClassType, {
		"act_name": act_name,
		"display_name": displayName,
		"cur_level": level,
		"cur_exp": curExp,
		"curHP": float(curHP)/maxHP * stats[CharData.StatType.HEALTH],
		"maxHP": stats[CharData.StatType.HEALTH],
		"class_type": int(classType),
		"max_exp": maxExp,
		"cur_sp": curSp,
		"curAP": float(curAP)/maxAP * stats[CharData.StatType.ARTISTRY],
		"maxAP": stats[CharData.StatType.ARTISTRY],
		"stats": [stats[CharData.StatType.HEALTH], stats[CharData.StatType.ARTISTRY], stats[CharData.StatType.ATTACK], stats[CharData.StatType.MAGIC], stats[CharData.StatType.DEFENSE], stats[CharData.StatType.RESISTANCE], stats[CharData.StatType.SPEED]],
		"arts": arts,
		"equippedArts": arts,
		"affinities": affinities,
		"growths": [stat_growths[1], stat_growths[2], stat_growths[3], stat_growths[4], stat_growths[5]], #extend to 100...
		"equipment": [equipment[ItemRes.ItemType.WEAPON], equipment[ItemRes.ItemType.ARMOR], equipment[ItemRes.ItemType.ACCESSORY]]
	})

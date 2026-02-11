extends Battler
class_name BattlerP

var curAP: int
var maxAP: int

var classType: CharData.ClassType

@onready var command = $Sprite3D2
@onready var cm: Control = $Sprite3D2/SubViewport/CommandMenu
@onready var anim_sprite: AnimatedSprite3D = $AnimatedSprite3D

func create(is_player: bool, c_data: CharData = null, f_data: EnemyData = null, control: Controller = Controller.PLAYER1) -> void:
	super(is_player, c_data, f_data, control)
	classType = c_data.class_type
	
	match classType:
		CharData.ClassType.KNIGHT:
			anim_sprite.sprite_frames = load("res://Images/Sprites/Battle/knight_battle.tres")
		CharData.ClassType.THIEF:
			anim_sprite.sprite_frames = load("res://Images/Sprites/Battle/thief_battle.tres")
		CharData.ClassType.MAGE:
			anim_sprite.sprite_frames = load("res://Images/Sprites/Battle/mage_battle.tres")
		CharData.ClassType.CLERIC:
			anim_sprite.sprite_frames = load("res://Images/Sprites/Battle/cleric_battle.tres")
		CharData.ClassType.CLOWN:
			anim_sprite.sprite_frames = load("res://Images/Sprites/Battle/clown_battle.tres")
		CharData.ClassType.ALCHEMIST:
			anim_sprite.sprite_frames = load("res://Images/Sprites/Battle/alchemist_battle.tres")
		CharData.ClassType.BARD:
			anim_sprite.sprite_frames = load("res://Images/Sprites/Battle/bard_battle.tres")
		CharData.ClassType.BRAWLER:
			anim_sprite.sprite_frames = load("res://Images/Sprites/Battle/brawler_battle.tres")
		CharData.ClassType.MEDIC:
			anim_sprite.sprite_frames = load("res://Images/Sprites/Battle/medic_battle.tres")
		CharData.ClassType.ARCANIST:
			anim_sprite.sprite_frames = load("res://Images/Sprites/Battle/arcanist_battle.tres")
		CharData.ClassType.DRUID:
			anim_sprite.sprite_frames = load("res://Images/Sprites/Battle/druid_battle.tres")
		CharData.ClassType.SWORDMASTER:
			anim_sprite.sprite_frames = load("res://Images/Sprites/Battle/swordmaster_battle.tres")
		CharData.ClassType.HORROR:
			anim_sprite.sprite_frames = load("res://Images/Sprites/Battle/horror_battle.tres")
		CharData.ClassType.WITCH:
			anim_sprite.sprite_frames = load("res://Images/Sprites/Battle/witch_battle.tres")
			
	anim_sprite.play("idle")

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

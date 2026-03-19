extends CharacterBody3D

const SPEED = 5.0
const JUMP_VELOCITY = 4.5

var building

@export var ui: Control

@onready var anim_sprite: AnimatedSprite3D = $AnimatedSprite3D

func _ready() -> void:
	ui.player = self
	ui_show()
	
	match (PlayerData.party[0].class_type):
		CharData.ClassType.KNIGHT:
			anim_sprite.sprite_frames = load("res://Images/Sprites/Field/knight_field.tres")
		CharData.ClassType.THIEF:
			anim_sprite.sprite_frames = load("res://Images/Sprites/Field/thief_field.tres")
		CharData.ClassType.MAGE:
			anim_sprite.sprite_frames = load("res://Images/Sprites/Field/mage_field.tres")
		CharData.ClassType.CLERIC:
			anim_sprite.sprite_frames = load("res://Images/Sprites/Field/cleric_field.tres")
		CharData.ClassType.CLOWN:
			anim_sprite.sprite_frames = load("res://Images/Sprites/Field/clown_field.tres")
		CharData.ClassType.ALCHEMIST:
			anim_sprite.sprite_frames = load("res://Images/Sprites/Field/alchemist_field.tres")
		CharData.ClassType.BARD:
			anim_sprite.sprite_frames = load("res://Images/Sprites/Field/bard_field.tres")
		CharData.ClassType.BRAWLER:
			anim_sprite.sprite_frames = load("res://Images/Sprites/Field/brawler_field.tres")
		CharData.ClassType.MEDIC:
			anim_sprite.sprite_frames = load("res://Images/Sprites/Field/medic_field.tres")
		CharData.ClassType.ARCANIST:
			anim_sprite.sprite_frames = load("res://Images/Sprites/Field/arcanist_field.tres")
		CharData.ClassType.DRUID:
			anim_sprite.sprite_frames = load("res://Images/Sprites/Field/druid_field.tres")
		CharData.ClassType.SWORDMASTER:
			anim_sprite.sprite_frames = load("res://Images/Sprites/Field/swordmaster_field.tres")
		CharData.ClassType.HORROR:
			anim_sprite.sprite_frames = load("res://Images/Sprites/Field/horror_field.tres")
		CharData.ClassType.WITCH:
			anim_sprite.sprite_frames = load("res://Images/Sprites/Field/witch_field.tres")
	
	anim_sprite.play("idle_down")

func _physics_process(delta: float) -> void:
	if PlayerData.ui_open:
		return
	
	if not is_on_floor():
		velocity += get_gravity() * delta

	var input_dir := Input.get_vector("move_left", "move_right", "move_up", "move_down")
	var direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()

	if Input.is_action_just_pressed("menu"):
		ui_show()

	if Input.is_action_just_pressed("confirm") && building:
		building.openUI()
		# might want to use return

func ui_show():
	ui.visible = !ui.visible
	ui.set_process(ui.visible)
	PlayerData.ui_open = ui.visible

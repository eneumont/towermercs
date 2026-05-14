extends CharacterBody3D

const SPEED = 5.0
const JUMP_VELOCITY = 4.5

var next_scn: String = ""
var next_pos: Vector3 = Vector3.ZERO

@export var ui: Control

@onready var anim_sprite: AnimatedSprite3D = $AnimatedSprite3D

var dir_s := "_down"

func _ready() -> void:
	ui.player = self
	ui_show()
	
	anim_sprite.sprite_frames = load("res://Images/Sprites/Field/" + CharData.ClassType.keys()[PlayerData.party[0].class_type].to_lower() + "_field.tres")

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

	if Input.is_action_just_pressed("confirm") && next_scn != "":
		SceneManager.new_scene(next_scn, next_pos) #might want to create var for player pos tracking
		# might want to use return
	
	animations(direction)

func ui_show():
	ui.visible = !ui.visible
	ui.set_process(ui.visible)
	ui.change_scr(0)
	PlayerData.ui_open = ui.visible

func animations(dir: Vector3):
	if dir.z > 0:
		dir_s = "_down"
		anim_sprite.flip_h = false
	elif dir.z < 0:
		dir_s = "_up"
		anim_sprite.flip_h = false
	elif dir.x > 0:
		dir_s = "_right"
		anim_sprite.flip_h = false
	elif dir.x < 0:
		dir_s = "_right"
		anim_sprite.flip_h = true
		
	if velocity.length() > 0:
		anim_sprite.play("walk" + dir_s)
	else:
		anim_sprite.play("idle" + dir_s)

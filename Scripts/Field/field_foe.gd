extends CharacterBody3D

var speed  = randf_range(2.0, 4.0)
@export var model = Node3D
@export var area: Area3D

@onready var anim_tree = %AnimationTree

var player

func _ready() -> void:
	for body in area.get_overlapping_bodies():
		if body.name == "FieldChar":
			player = body

func _physics_process(delta: float) -> void:
	velocity = Vector3.ZERO
	if player:
		var direction = global_position.direction_to(player.global_position)
		direction.y = 0.0
		velocity = direction * speed
		model.rotation.y = Vector3.FORWARD.signed_angle_to(direction, Vector3.UP) + PI

		if velocity == Vector3.ZERO:
			anim_tree.set("paramters/iwr_blend/blend_amount", -1.0) #a
		else:
			anim_tree.set("paramters/iwr_blend/blend_amount", 1.0) #a
	
	move_and_slide()

func _on_area_3d_body_entered(body: Node3D) -> void:
	if body.name == "FieldChar":
		player = body

func _on_area_3d_body_exited(body: Node3D) -> void:
	if body.name == "FieldChar":
		player = null

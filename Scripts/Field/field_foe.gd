extends CharacterBody3D

var speed  = randf_range(2.0, 4.0)
var anim_tree: AnimationTree
var encounters: Array[String]
var model: Node3D

var player
var foe_id
var spawner

func _ready() -> void:
	model = get_node("Model")
	anim_tree = model.get_node("AnimationTree")

func _physics_process(delta: float) -> void:
	var space_state = get_world_3d().direct_space_state
	var query = PhysicsRayQueryParameters3D.create(global_position, Vector3(0, 3, 9))
	query.exclude = [self]
	var result = space_state.intersect_ray(query)
	
	if (result && result["collider"].name == "FieldChar" && !player):
		player = result["collider"]
	else:
		player = null
	
	velocity = Vector3.ZERO
	if player:
		var direction = global_position.direction_to(player.global_position)
		direction.y = 0.0
		velocity = direction * speed
		rotation.y = Vector3.FORWARD.signed_angle_to(direction, Vector3.UP) + PI
	
	if velocity == Vector3.ZERO:
		anim_tree.set("paramters/iwr_blend/blend_amount", -1.0) 
	else:
		anim_tree.set("paramters/iwr_blend/blend_amount", 1.0) 
	
	move_and_slide()

func _on_area_3d_body_entered(body: Node3D) -> void:
	print("Works")
	if body.name == "FieldChar":
		#startbattle
		print("Encounter!")
		pass

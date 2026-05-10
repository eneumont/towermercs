extends CharacterBody3D

var speed  = randf_range(3.0, 6.0)
var anim_tree: AnimationTree
var encounters: Array[String]

var player
var foe_id
var battle

var f_data: EnemyData

##should be walking when patroling and running when chase
enum FIELD_STATE {
	IDLE,
	PATROL,
	CHASE,
}

##whether will not move or walk around, etc...
enum FIELD_TYPE {
	STILL,
	GUARD,
}

func spawn():
	var model = f_data.model.instantiate()
	add_child(model)
	model.position = f_data.pos
	model.rotation = f_data.rot
	model.scale = f_data.sca
	
	anim_tree = model.get_node("AnimationTree")
	
	var area = $Area
	area.position = f_data.a_pos
	area.rotation = f_data.a_rot
	area.scale = f_data.a_sca
	
	#var detect = $Detect
	#detect.position = f_data.d_pos
	#detect.rotation = f_data.d_rot
	#detect.scale = f_data.d_sca

func _physics_process(delta: float) -> void:
	velocity = Vector3.ZERO
	if player:
		var direction = global_position.direction_to(player.global_position)
		direction.y = 0.0
		velocity = direction * speed
		rotation.y = Vector3.FORWARD.signed_angle_to(direction, Vector3.UP) + PI
	
	if velocity == Vector3.ZERO:
		anim_tree.set("parameters/iwr_blend/blend_amount", -1.0) 
	else:
		anim_tree.set("parameters/iwr_blend/blend_amount", 1.0) 
	
	move_and_slide()

func body_enter(body: Node3D) -> void:
	if body.name == "FieldChar":
		SceneManager.encounter = encounters[randi_range(0, encounters.size() - 1)]
		SceneManager.enter_battle("res://Scenes/Battle/Fields/" + battle + ".tscn", self) #consider mutliple encounters

func foe_enter(body:Node3D) -> void:
	if body is CharacterBody3D:
		player = body
	
func foe_exit(body:Node3D) -> void:
	if body == player:
		player = null

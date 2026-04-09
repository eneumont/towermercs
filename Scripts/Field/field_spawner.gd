extends Node3D

@export var spawn_node: PackedScene
@export var type: Spawner_Type
@export var encounters: Array[String]
@export var battle: String

##what dict looks like {"id": ["true: bool", "0,0,0: vector3"]}
@export var spawn_info: Dictionary[String, Array]

enum Spawner_Type {
	ITEM,
	FOE,
}

func spawn():
	var new_spawn = spawn_node.instantiate()
	add_child(new_spawn)
	new_spawn.global_position = position
	new_spawn.foe_id = spawn_info[spawn_info.keys()[0]]
	#new_spawn.spawner = self
	new_spawn.encounters = encounters
	new_spawn.battle = battle

	match (type):
		Spawner_Type.ITEM:
			pass
		Spawner_Type.FOE:
			pass

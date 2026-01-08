extends Node3D

@export var spawn_node: PackedScene
@export var type: Spawner_Type
@export var encounters: Array[String]

#what dict looks like {"id": ["alive", "0,0,0"]}
var spawn_id: String
var spawn_active: bool
var spawn_pos: Vector3

enum Spawner_Type {
	ITEM,
	FOE,
}

func spawn(new_pos: Vector3 = position):
	var new_spawn = spawn_node.instantiate()
	add_child(new_spawn)
	new_spawn.global_position = new_pos
	new_spawn.foe_id = spawn_id
	new_spawn.spawner = self
	new_spawn.encounters = encounters

	match (type):
		Spawner_Type.ITEM:
			pass
		Spawner_Type.FOE:
			pass

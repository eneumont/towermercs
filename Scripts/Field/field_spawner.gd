extends Node3D

@export var spawn_node: PackedScene

#what dict looks like {"id": ["alive", "0,0,0"]}
var spawn_id: String
var spawn_active: bool
var spawn_pos: Vector3

func spawn(new_pos: Vector3 = self.position):
	var new_spawn = spawn_node.instantiate()
	add_child(new_spawn)
	new_spawn.global_position = new_pos

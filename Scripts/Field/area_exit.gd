extends Area3D

@export var area_name: String
@export var pos: Vector3 = Vector3.ZERO

func body_enter(body: Node3D):
	if body is CharacterBody3D:
		SceneManager.new_scene(area_name, pos)

extends Node3D

@export var scn_name: String

@export var displayName: String
@export var description: String
@export var icon: Texture

@export var spot_ui: SpotUI

@onready var sprite: Sprite3D = $Sprite3D

func _ready() -> void:
	spot_ui.set_values(displayName, description, icon)

func _on_area_3d_body_entered(body: Node3D) -> void:
	if body is CharacterBody3D:
		sprite.visible = true
		body.next_scn = scn_name

func _on_area_3d_body_exited(body: Node3D) -> void:
	if body is CharacterBody3D:
		sprite.visible = false
		body.next_scn = ""

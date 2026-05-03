extends Node3D

@export var scn_name: String
@export var s_pos: Vector3 = Vector3.ZERO

@export var displayName: String
@export var description: String
@export var icon: Texture

@onready var sprite: Sprite3D = $Sprite3D

func _ready() -> void:
	sprite.get_node("SubViewport/Control/WorldSpotUI/Icon").texture = icon
	sprite.get_node("SubViewport/Control/WorldSpotUI/NameBg/Name").text = displayName
	sprite.get_node("SubViewport/Control/WorldSpotUI/DescriptionBg/Description").text = description

func _on_area_3d_body_entered(body: Node3D) -> void:
	if body is CharacterBody3D:
		sprite.visible = true
		body.next_scn = scn_name
		body.next_pos = s_pos

func _on_area_3d_body_exited(body: Node3D) -> void:
	if body is CharacterBody3D:
		sprite.visible = false
		body.next_scn = ""
		body.next_pos = Vector3.ZERO

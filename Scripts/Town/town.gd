extends Node3D

var player_scn: PackedScene = preload("res://Scenes/Field/FieldChar.tscn")

func _ready() -> void:
	var fieldChar = player_scn.instantiate()
	add_child(fieldChar)
	fieldChar.position = PlayerData.player_pos

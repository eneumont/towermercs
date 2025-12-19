extends Node3D

@export var player_scn: PackedScene = preload("res://Scenes/WorldMap/WorldPlayer.tscn")

func _ready() -> void:
	var worldPlayer = player_scn.instantiate()
	add_child(worldPlayer)
	worldPlayer.position = PlayerData.player_pos

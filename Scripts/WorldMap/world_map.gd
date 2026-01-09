extends Node3D

@export var player_scn: PackedScene = preload("res://Scenes/WorldMap/WorldPlayer.tscn")
@export var audio: AudioStream

func _ready() -> void:
	MusicManager.stream = audio
	MusicManager.play()
	
	var worldPlayer = player_scn.instantiate()
	add_child(worldPlayer)
	worldPlayer.position = PlayerData.player_pos

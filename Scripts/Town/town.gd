extends Node3D

@export var audio: AudioStream

var player_scn: PackedScene = preload("res://Scenes/Field/FieldChar.tscn")

func _ready() -> void:
	MusicManager.stream = audio
	MusicManager.play()
	
	var fieldChar = player_scn.instantiate()
	add_child(fieldChar)
	fieldChar.position = PlayerData.player_pos

extends Node

@export var spawners: Array[Node3D]
@export var items: Array[Node3D]
@export var audio: AudioStream

var player_scn: PackedScene = preload("res://Scenes/Field/FieldChar.tscn")

func _ready() -> void:
	MusicManager.stream = audio
	MusicManager.play()
	
	if PlayerData.loadin:
		var foes = PlayerData.foes
		
		for f in spawners:
			if foes[f.foe_id][0]:
				f.spawn(foes[f.foe_id][1])
	else:
		for s in spawners:
			s.spawn()
	
	var fieldChar = player_scn.instantiate()
	add_child(fieldChar)
	fieldChar.position = PlayerData.player_pos

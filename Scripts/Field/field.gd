extends Node

@export var enemies: Array[Node3D]
@export var items: Array[Node3D]
@export var audio: AudioStream

var player_scn: PackedScene = preload("res://Scenes/Field/FieldChar.tscn")

func _ready() -> void:
	MusicManager.stream = audio
	MusicManager.play()
	
	#prob gonna hve to redo foe pos logic here...
	if PlayerData.loadin:
		var foes = PlayerData.foes
		
		for f in enemies:
			if foes[f.id]:
				f.spawn()
	else:
		for s in enemies:
			s.spawn()
	
	var fieldChar = player_scn.instantiate()
	add_child(fieldChar)
	fieldChar.position = PlayerData.player_pos

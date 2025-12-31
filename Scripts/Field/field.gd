extends Node

@export var field_foes: Array[FieldFoe]
@export var items: Array

var foes: Dictionary
var player_scn: PackedScene = preload("res://Scenes/Field/FieldChar.tscn")

func _ready() -> void:
	if PlayerData.loadin:
		foes = PlayerData.foes
		
		for f in field_foes:
			if foes[f.foe_id][0]:
				f.position = foes[f.foe_id][1]
			else:
				pass	
	else:
		pass

	var fieldChar = player_scn.instantiate()
	add_child(fieldChar)
	fieldChar.position = PlayerData.player_pos

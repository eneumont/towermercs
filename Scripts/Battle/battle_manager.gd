extends Node3D

@export var audio: AudioStream

@export var BattlerPosList = []
@export var Battlers = []
@export var aliveBattlers = []
@export var PlayerBattlers = []
@export var FoeBattlers = []
@export var Encounter = []
@export var casted_skill: String #or SkillRes
@export var cur_turnOrder = []
@export var next_turnOrder = []
@export var targets = []

var feedback: String

func _ready() -> void:
	MusicManager.stream = audio
	MusicManager.play()
	
	spawn_battlers()
	new_turnOrder(true)

func new_turn():
	if not cur_turnOrder.is_empty():
		cur_turnOrder[0].start_turn()
	else:
		new_turnOrder(false)

func new_turnOrder(begin: bool):
	if begin:
		cur_turnOrder = aliveBattlers
		
		#maybe add a check for ties
		for b in cur_turnOrder.size():
			for c in cur_turnOrder.size() - 1:
				if (cur_turnOrder[c].currentStats[CharData.StatType.SPEED] > cur_turnOrder[c + 1].currentStats[CharData.StatType.SPEED]):
					var temp = cur_turnOrder[c]
					cur_turnOrder[c] = cur_turnOrder[c + 1]
					cur_turnOrder[c + 1] = temp
			
	else:
		cur_turnOrder = next_turnOrder

	new_nextTurnOrder()
	new_turn()
	
func new_nextTurnOrder():
	next_turnOrder = aliveBattlers
		
	#maybe add a check for ties
	for b in next_turnOrder.size():
		for c in next_turnOrder.size() - 1:
			if (next_turnOrder[c].currentStats[CharData.StatType.SPEED] > next_turnOrder[c + 1].currentStats[CharData.StatType.SPEED]):
				var temp = next_turnOrder[c]
				next_turnOrder[c] = next_turnOrder[c + 1]
				next_turnOrder[c + 1] = temp

func spawn_battlers():
	for p in PlayerData.party:
		PlayerBattlers.append(Battler.new(true, p))

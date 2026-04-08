extends Node3D

@export var audio: AudioStream

@export var BattlerPosList: Array[Marker3D]
@export var Battlers: Array[Battler]
@export var aliveBattlers: Array[Battler]
@export var PlayerBattlers: Array[BattlerP]
@export var FoeBattlers: Array[BattlerE]

@onready var UI = $BattleUI

#prob gonna need to change how casting arts work to rely on bm more to allow more interactivity
var casted_art: String
var cur_turn: Battler
var targets = []
var cur_turnOrder = []
var next_turnOrder = []

var exp_won: int = 0
var sp_won: int = 0

func _ready() -> void:
	MusicManager.stream = audio
	MusicManager.play()
	
	UI.set_bm(self)
	spawn_battlers()
	UI.set_party()
	
	#play jump-ins and roars
	new_feed("Kill them all!!!")
	
	new_turnOrder(true)

func new_turn():
	casted_art = ""
	targets = []
	cur_turn = null
	
	if aliveBattlers.filter(func(b): return b.get_script().get_global_name() == "BattlerP").is_empty(): 
		battle_end(false)
		return
		
	if aliveBattlers.filter(func(b): return b.get_script().get_global_name() == "BattlerE").is_empty(): 
		battle_end(true)
		return
	
	if not cur_turnOrder.is_empty():
		UI.set_turns()
		cur_turn = cur_turnOrder[0]
		cur_turn.start_turn()
	else:
		new_turnOrder(false)

func new_turnOrder(begin: bool):
	if begin:
		cur_turnOrder = aliveBattlers.duplicate()
		
		#maybe add a check for ties
		for b in cur_turnOrder.size() - 1:
			for c in cur_turnOrder.size() - b - 1:
				if (cur_turnOrder[c].currentStats[CharData.StatType.SPEED] < cur_turnOrder[c + 1].currentStats[CharData.StatType.SPEED]):
					var temp = cur_turnOrder[c]
					cur_turnOrder[c] = cur_turnOrder[c + 1]
					cur_turnOrder[c + 1] = temp
			
	else:
		cur_turnOrder = next_turnOrder.duplicate()
	
	new_nextTurnOrder()
	new_turn()

func new_nextTurnOrder():
	next_turnOrder = aliveBattlers.duplicate()
		
	#maybe add a check for ties
	for b in next_turnOrder.size() - 1:
		for c in next_turnOrder.size() - b - 1:
			if (next_turnOrder[c].currentStats[CharData.StatType.SPEED] < next_turnOrder[c + 1].currentStats[CharData.StatType.SPEED]):
				var temp = next_turnOrder[c]
				next_turnOrder[c] = next_turnOrder[c + 1]
				next_turnOrder[c + 1] = temp

func spawn_battlers():
	var scn = load("res://Scenes/Battle/Characters/BattlerPlayer.tscn") #may change for specific char spawning
	
	for i in PlayerData.party.size():
		var new_battler = scn.instantiate()
		new_battler.bm = self
		new_battler.create(true, PlayerData.party[i]) #assign multiplayer with control
		PlayerBattlers.append(new_battler)
		Battlers.append(new_battler)
		if new_battler.curHP > 0: aliveBattlers.append(new_battler)
		BattlerPosList[i].add_child(new_battler)
	
	scn = load("res://Scenes/Battle/Characters/BattlerEnemy.tscn") #prob change for specific foe spawning
	
	for i in SceneManager.encounter.split(",").size():
		var new_battler = scn.instantiate()
		new_battler.bm = self
		new_battler.create(false, null, EnemyDatabase.get_foe(SceneManager.encounter.split(",")[i]))
		new_battler.displayName = new_battler.displayName + str(i) #figure how naming enemies should work
		FoeBattlers.append(new_battler)
		Battlers.append(new_battler)
		aliveBattlers.append(new_battler)
		BattlerPosList[i + 4].add_child(new_battler)

func battle_end(win: bool):
	UI.end(win)
	
	#if win:
		##give rewards
		#SceneManager.pop_scene()
	#else:
		##go to main menu or something else
		#pass

func new_feed(f: String):
	UI.feed(f)

func cast():
	new_feed(ArtDatabase.get_art(casted_art).cast(cur_turn, targets).replace("NAME", cur_turn.displayName))

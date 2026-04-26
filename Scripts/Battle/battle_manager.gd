extends Node3D

@export var audio: AudioStream
@export var center_pos: Vector3
@export var BattlerPosList: Array[Marker3D]

@onready var UI = $BattleUI

var Battlers: Array[Battler]
var aliveBattlers: Array[Battler]
var PlayerBattlers: Array[BattlerP]
var FoeBattlers: Array[BattlerE]

var casted_art: String
var cur_turn: Battler
var targets = []
var cur_turnOrder = []
var next_turnOrder = []

var exp_won: int = 0
var sp_won: int = 0
var money_won: int = 0

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
		spawn_battler(true, scn, PlayerData.party[i], i)
	
	scn = load("res://Scenes/Battle/Characters/BattlerEnemy.tscn") #prob change for specific foe spawning
	
	for i in SceneManager.encounter.split(",").size():
		spawn_battler(false, scn, EnemyDatabase.get_foe(SceneManager.encounter.split(",")[i]), i + 4)

func spawn_battler(player: bool, scene, data, pos: int, control = null): #control for multiplayer
	var new_battler = scene.instantiate()
	new_battler.bm = self
	new_battler.create(player, data) #assign multiplayer with control
	
	if player:
		PlayerBattlers.append(new_battler)
		new_battler.origin_pos = BattlerPosList[pos].position
	else:
		new_battler.displayName = new_battler.displayName + str(pos) #figure how naming enemies should work
		new_battler.act_name = new_battler.displayName + str(pos) #figure naming
		FoeBattlers.append(new_battler)
	
	Battlers.append(new_battler)
	if new_battler.curHP > 0: aliveBattlers.append(new_battler)
	BattlerPosList[pos].add_child(new_battler)

func battle_end(win: bool):
	if win:
		#update party
		for p in PlayerBattlers:
			if PlayerData.party.any(func(c): return p.act_name == c.act_name):
				PlayerData.party[PlayerData.party.rfind_custom(func(c): return p.act_name == c.act_name)] = p.battler_to_char()
				continue
			if PlayerData.reserve.any(func(c): return p.act_name == c.act_name):
				PlayerData.reserve[PlayerData.reserve.rfind_custom(func(c): return p.act_name == c.act_name)] = p.battler_to_char()
				continue
		
		#probably change value on lv dif or not...
		UI.money_won = money_won
		UI.exp_won = exp_won
		UI.sp_won = sp_won
	UI.end(win)

func new_feed(f: String):
	UI.feed(f)

func cast():
	new_feed(ArtDatabase.get_art(casted_art).cast(cur_turn, targets))
	UI.set_party()

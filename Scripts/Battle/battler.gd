extends CharacterBody3D
class_name Battler

enum Team {
	ALLY,
	FOE,
}

enum Player {
	PLAYER,
	AI,
}

enum Controller {
	NONE,
	PLAYER1,
	PLYAER2,
	PLAYER3,
	PLAYER4,
}

@onready var selector = $Sprite3D

var bm

var act_name: String
var displayName: String
var level: int
var curExp: int
var nextExp: int
var curSp: int
var curHP: int
var maxHP: int
var team: Team
var player: Player
var controller: Controller

var defending: bool = false
var dead: bool = false
var effects: Array

var currentStats = {
	CharData.StatType.HEALTH: 10,
	CharData.StatType.ARTISTRY: 10,
	CharData.StatType.ATTACK: 10,
	CharData.StatType.MAGIC: 10,
	CharData.StatType.DEFENSE: 10,
	CharData.StatType.RESISTANCE: 10,
	CharData.StatType.SPEED: 10,
}

var stats = {
	CharData.StatType.HEALTH: 10,
	CharData.StatType.ARTISTRY: 10,
	CharData.StatType.ATTACK: 10,
	CharData.StatType.MAGIC: 10,
	CharData.StatType.DEFENSE: 10,
	CharData.StatType.RESISTANCE: 10,
	CharData.StatType.SPEED: 10,
}

var modifiers = {
	CharData.StatType.HEALTH: 1.0,
	CharData.StatType.ARTISTRY: 1.0,
	CharData.StatType.ATTACK: 1.0,
	CharData.StatType.MAGIC: 1.0,
	CharData.StatType.DEFENSE: 1.0,
	CharData.StatType.RESISTANCE: 1.0,
	CharData.StatType.SPEED: 1.0,
}

var arts: Array

var equipment

#figure multiplayer with control
func create(is_player: bool, c_data: CharData = null, f_data: EnemyData = null, control: Controller = Controller.PLAYER1) -> void:
	team = Team.ALLY if is_player else Team.FOE
	player = Player.PLAYER if is_player else Player.AI
	displayName = c_data.display_name if is_player else f_data.display_name
	act_name = c_data.act_name if is_player else "" #determine foe act name
	arts = c_data.equippedArts if is_player else f_data.equippedArts
	curExp = c_data.cur_exp if is_player else f_data.cur_exp
	level = c_data.cur_level if is_player else f_data.cur_level
	curSp = c_data.cur_sp if is_player else f_data.cur_sp
	if is_player: nextExp = c_data.next_exp #how should give exp?
	if is_player: controller = control #assign controller, multiplayer though
	
	#set player equipment do i wanna give foes equipment?
	#set affinities too...
	
	stats = c_data.stats if is_player else f_data.stats
	curHP = c_data.curHP if is_player else f_data.curHP
	maxHP = c_data.maxHP if is_player else f_data.maxHP
	set_cur_stats()

## sets cur stats to be stats * modifiers  [br]
## cur stats are primarily used in battle
func set_cur_stats():
	currentStats[CharData.StatType.HEALTH] = stats[CharData.StatType.HEALTH] * modifiers[CharData.StatType.HEALTH]
	currentStats[CharData.StatType.ARTISTRY] = stats[CharData.StatType.ARTISTRY] * modifiers[CharData.StatType.ARTISTRY]
	currentStats[CharData.StatType.ATTACK] = stats[CharData.StatType.ATTACK] * modifiers[CharData.StatType.ATTACK]
	currentStats[CharData.StatType.MAGIC] = stats[CharData.StatType.MAGIC] * modifiers[CharData.StatType.MAGIC]
	currentStats[CharData.StatType.DEFENSE] = stats[CharData.StatType.DEFENSE] * modifiers[CharData.StatType.DEFENSE]
	currentStats[CharData.StatType.RESISTANCE] = stats[CharData.StatType.RESISTANCE] * modifiers[CharData.StatType.RESISTANCE]
	currentStats[CharData.StatType.SPEED] = stats[CharData.StatType.SPEED] * modifiers[CharData.StatType.SPEED]
	curHP = float(curHP)/maxHP * currentStats[CharData.StatType.HEALTH]
	maxHP = currentStats[CharData.StatType.HEALTH]

func start_turn():
	if dead: end_turn()
	defending = false
	set_cur_stats()

func end_turn():
	bm.cur_turnOrder.remove_at(0)
	bm.new_turn()

## for healing/damaging [br]
## heal pos num / dmg neg num
func take_damage(dmg: int):
	curHP += dmg
	if curHP > maxHP: curHP = maxHP
	if curHP <= 0:
		curHP = 0
		die()

func die():
	dead = true
	
	bm.aliveBattlers.erase(self)
	bm.Battlers.erase(self)
	if team == Team.FOE: bm.FoeBattlers.erase(self)
	bm.cur_turnOrder.erase(self)
	bm.next_turnOrder.erase(self)
	
	if player == Player.AI: call_deferred("queue_free") # checks ai for multiplayer... maybe...

func do_effects():
	pass

func show_select():
	selector.visible = true
	#might want to change how select is updated
	selector.get_node("SubViewport/SelectUI/VBox/SelectHP").value = 100.0 * (float(curHP) / maxHP)

func hide_select():
	selector.visible = false

func clicked(cam: Node, evt: InputEvent, pos: Vector3, nor: Vector3, shape: int):
	if Input.is_action_just_released("l_click"):
		if not bm.casted_art.is_empty(): #prob add lot of checks here...
			var art := ArtDatabase.get_art(bm.casted_art)
			var a_targets: Array[Battler]
			
			if (art.hp_cost >= bm.cur_turn.curHP) || (art.ap_cost > bm.cur_turn.curAP):
				bm.new_feed(bm.cur_turn.displayName + " can't muster the strength to do that...")
				return
			
			if art.team == ArtRes.TargetTeam.ALL:
				a_targets = bm.aliveBattlers
			elif art.team == ArtRes.TargetTeam.SELF:
				a_targets = bm.aliveBattlers.filter(func(b): return b == self)
			else:
				if team == Team.ALLY && art.team == ArtRes.TargetTeam.ALLY:
					match art.group:
						ArtRes.GroupType.SINGLE:
							a_targets.append(self)
						ArtRes.GroupType.TEAM:
							a_targets.append_array(bm.aliveBattlers.filter(func(b): return b.team == Battler.Team.ALLY))
				elif team == Team.FOE && art.team == ArtRes.TargetTeam.FOE:
					match art.group:
						ArtRes.GroupType.SINGLE:
							a_targets.append(self)
						ArtRes.GroupType.TEAM:
							a_targets.append_array(bm.aliveBattlers.filter(func(b): return b.team == Battler.Team.FOE))
				else: #will do nothing if wrong target clicked
					return
			
			bm.targets.append_array(a_targets)
			bm.cast()
			 
			# update selector ui
			bm.cur_turn.selector.get_node("SubViewport/SelectUI/VBox/SelectHP").value = 100.0 * (float(bm.cur_turn.curHP) / bm.cur_turn.maxHP)
			for b in bm.targets:
				b.selector.get_node("SubViewport/SelectUI/VBox/SelectHP").value = 100.0 * (float(b.curHP) / b.maxHP)
				
			bm.cur_turn.end_turn()
		else:
			# show analyse menu or somethin
			pass

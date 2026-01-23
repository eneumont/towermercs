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
	CharData.StatType.HEALTH: 10.0,
	CharData.StatType.ARTISTRY: 10.0,
	CharData.StatType.ATTACK: 10.0,
	CharData.StatType.MAGIC: 10.0,
	CharData.StatType.DEFENSE: 10.0,
	CharData.StatType.RESISTANCE: 10.0,
	CharData.StatType.SPEED: 10.0,
}

var arts: Array

var equipment

func create(is_player: bool, c_data: CharData = null, f_data: EnemyData = null, control: Controller = Controller.PLAYER1) -> void:
	if is_player:
		team = Team.ALLY
		player = Player.PLAYER
		displayName = c_data.display_name
		arts = c_data.equippedArts
	else:
		team = Team.FOE
		player = Player.AI
		displayName = f_data.display_name
		arts = f_data.equippedArts

func start_turn():
	defending = false

func end_turn():
	bm.cur_turnOrder.remove_at(0)
	bm.new_turn()

func take_damage(dmg: int):
	curHP += dmg
	if curHP > maxHP: curHP = maxHP
	if curHP <= 0:
		curHP = 0
		die()

func die():
	dead = true
	bm.aliveBattlers.remove(self)

func do_effects():
	pass

func show_select():
	selector.visible = true

func hide_select():
	selector.visible = false

func clicked(cam: Node, evt: InputEvent, pos: Vector3, nor: Vector3, shape: int):
	if Input.is_action_just_released("l_click"):
		if not bm.casted_art.is_empty(): #prob add lot of checks here...
			var art := ArtDatabase.get_art(bm.casted_art)
			var a_targets: Array[Battler]
			
			if art.team == ArtRes.TargetTeam.ALL:
				a_targets = bm.aliveBattlers
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
			
			bm.targets.append_array(a_targets)
			bm.cast()
		else:
			#show analyse menu or somethin
			pass

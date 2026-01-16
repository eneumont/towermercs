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

var skills

var equipment

func create(is_player: bool, c_data: CharData = null, f_data: EnemyData = null, control: Controller = Controller.PLAYER1) -> void:
	if is_player:
		team = Team.ALLY
		player = Player.PLAYER
		displayName = c_data.display_name
	else:
		team = Team.FOE
		player = Player.AI
		displayName = f_data.display_name

func start_turn():
	defending = false

func end_turn():
	bm.cur_turnOrder.remove_at(0)
	bm.new_turn()

func take_damage(dmg: int):
	curHP += dmg
	if curHP > maxHP: curHP = maxHP

func do_effects():
	pass

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

var name: String
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

func start_turn():
	defending = false

func take_damage(dmg: int):
	curHP += dmg
	if curHP > maxHP: curHP = maxHP

func do_effects():
	pass

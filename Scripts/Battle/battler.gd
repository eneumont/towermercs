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
var curAP: int
var team: Team
var player: Player
var controller: Controller

var currentStats = {
	CharData.StatType.HEALTH: 10,
	CharData.StatType.ARTISTRY: 10,
	CharData.StatType.ATTACK: 10,
	CharData.StatType.MAGIC: 10,
	CharData.StatType.DEFENSE: 10,
	CharData.StatType.RESISTANCE: 10,
	CharData.StatType.SPEED: 10,
}

var skills

var equipment

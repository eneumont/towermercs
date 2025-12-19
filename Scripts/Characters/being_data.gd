extends Node
class_name BeingData

enum StatType {
	HEALTH,
	ARTISTRY,
	ATTACK,
	MAGIC,
	DEFENSE,
	RESISTANCE,
	SPEED
}

var act_name: String
var display_name: String
var cur_level: int
var cur_exp: int
var curHP: int
var maxHP: int #iffy on curHP and maxHP vs stats and cur_stats Health

var stats: Dictionary = {
	StatType.HEALTH : 1,
	StatType.ARTISTRY : 1,
	StatType.ATTACK : 1,
	StatType.MAGIC : 1,
	StatType.DEFENSE : 1,
	StatType.RESISTANCE : 1,
	StatType.SPEED : 1,
}

var cur_stats: Dictionary = {
	StatType.HEALTH : 1,
	StatType.ARTISTRY : 1,
	StatType.ATTACK : 1,
	StatType.MAGIC : 1,
	StatType.DEFENSE : 1,
	StatType.RESISTANCE : 1,
	StatType.SPEED : 1,
}

var equippedArts : Array = [
	
]

func set_stats(new_stats: Array):
	stats.StatType.HEALTH = new_stats[0]
	stats.StatType.ARTISTRY = new_stats[1]
	stats.StatType.ATTACK = new_stats[2]
	stats.StatType.MAGIC = new_stats[3]
	stats.StatType.DEFENSE = new_stats[4]
	stats.StatType.RESISTANCE = new_stats[5]
	stats.StatType.SPEED = new_stats[6]

func set_arts(new_arts: Array):
	equippedArts = new_arts

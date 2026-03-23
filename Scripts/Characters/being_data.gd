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

enum AffinityType {
	PURE_PHYSICAL,
	BLUNT,
	PIERCE,
	SLASH,
	FIRE,
	WATER,
	EARTH,
	WIND,
	LIGHT,
	DARK,
	PURE_MAGICAL,
}

enum AffinityRate {
	GREAT,
	OK,
	NEUTRAL,
	BAD,
	POOR,
}

var act_name: String
var display_name: String
var cur_level: int
var cur_exp: int
var curHP: int = 5
var maxHP: int = 10

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

var affinities: Dictionary = {
	AffinityType.BLUNT : AffinityRate.NEUTRAL,
	AffinityType.PIERCE : AffinityRate.NEUTRAL,
	AffinityType.SLASH : AffinityRate.NEUTRAL,
	AffinityType.FIRE : AffinityRate.NEUTRAL,
	AffinityType.WATER : AffinityRate.NEUTRAL,
	AffinityType.EARTH : AffinityRate.NEUTRAL,
	AffinityType.WIND : AffinityRate.NEUTRAL,
	AffinityType.LIGHT : AffinityRate.NEUTRAL,
	AffinityType.DARK : AffinityRate.NEUTRAL,
}

func set_stats(new_stats: Array):
	stats[StatType.HEALTH] = new_stats[0]
	stats[StatType.ARTISTRY] = new_stats[1]
	stats[StatType.ATTACK] = new_stats[2]
	stats[StatType.MAGIC] = new_stats[3]
	stats[StatType.DEFENSE] = new_stats[4]
	stats[StatType.RESISTANCE] = new_stats[5]
	stats[StatType.SPEED] = new_stats[6]

## sets EQUIPPED ARTS used by both char and foe [br]
## parameter new_arts an array of art names  (Array[String]) to be equipped
func set_arts(new_arts: Array):
	equippedArts = new_arts

func set_affinities(new_affinities: Dictionary):
	affinities = new_affinities

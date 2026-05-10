extends Resource
class_name EnemyData

@export var id: String
@export var act_name: String
@export var display_name: String
@export var cur_level: int
@export var cur_exp: int
@export var cur_sp: int
@export var money: int
@export var model: PackedScene
@export var pos: Vector3
@export var rot: Vector3
@export var sca: Vector3
@export var a_pos: Vector3
@export var a_rot: Vector3
@export var a_sca: Vector3

@export var maxHP: int = 1
@export var curHP: int = 1

##
@export var stats: Dictionary = {
	BeingData.StatType.HEALTH : 1,
	BeingData.StatType.ARTISTRY : 1,
	BeingData.StatType.ATTACK : 1,
	BeingData.StatType.MAGIC : 1,
	BeingData.StatType.DEFENSE : 1,
	BeingData.StatType.RESISTANCE : 1,
	BeingData.StatType.SPEED : 1,
}

## should i have max? (nah...)
@export var equippedArts : Array[String]

##
@export var affinities: Dictionary = {
	BeingData.AffinityType.BLUNT : BeingData.AffinityRate.NEUTRAL,
	BeingData.AffinityType.PIERCE : BeingData.AffinityRate.NEUTRAL,
	BeingData.AffinityType.SLASH : BeingData.AffinityRate.NEUTRAL,
	BeingData.AffinityType.FIRE : BeingData.AffinityRate.NEUTRAL,
	BeingData.AffinityType.WATER : BeingData.AffinityRate.NEUTRAL,
	BeingData.AffinityType.EARTH : BeingData.AffinityRate.NEUTRAL,
	BeingData.AffinityType.WIND : BeingData.AffinityRate.NEUTRAL,
	BeingData.AffinityType.LIGHT : BeingData.AffinityRate.NEUTRAL,
	BeingData.AffinityType.DARK : BeingData.AffinityRate.NEUTRAL,
}

func set_stats(new_stats: Array):
	stats[BeingData.StatType.HEALTH] = new_stats[0]
	stats[BeingData.StatType.ARTISTRY] = new_stats[1]
	stats[BeingData.StatType.ATTACK] = new_stats[2]
	stats[BeingData.StatType.MAGIC] = new_stats[3]
	stats[BeingData.StatType.DEFENSE] = new_stats[4]
	stats[BeingData.StatType.RESISTANCE] = new_stats[5]
	stats[BeingData.StatType.SPEED] = new_stats[6]
	maxHP = stats[BeingData.StatType.HEALTH]
	curHP = maxHP

func set_arts(new_arts: Array):
	equippedArts = new_arts

func set_affinities(new_affinities: Dictionary):
	affinities = new_affinities

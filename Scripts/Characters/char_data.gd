extends BeingData
class_name CharData

enum ClassType {
	KNIGHT,
	THIEF,
	MAGE,
	CLERIC,
	ALCHEMIST,
	BARD,
	BRAWLER,
	MEDIC,
	CLOWN,
	ARCANIST,
	SWORDMASTER,
	WITCH,
	DRUID,
	HORROR,
}

var max_exp: int
var cur_sp: int
var class_type: ClassType
var curAP: int
var maxAP: int

var stat_growths: Dictionary = {
	StatType.HEALTH : 50.0,
	StatType.ARTISTRY : 50.0,
	StatType.ATTACK : 50.0,
	StatType.MAGIC : 50.0,
	StatType.DEFENSE : 50.0,
	StatType.RESISTANCE : 50.0,
	StatType.SPEED : 50.0,
}

var arts: Array = [
	
]

var equipment: Dictionary = {
	ItemRes.ItemType.WEAPON : "",
	ItemRes.ItemType.ARMOR : "",
	ItemRes.ItemType.ACCESSORY : "",
}

func _init(c_name: String, type: ClassType, pos: int = 0) -> void:
	act_name = str(type) + "" #figure what actual names should be made
	display_name = c_name
	cur_level = 1
	cur_exp = 0
	class_type = type
	
	match type:
		ClassType.KNIGHT:
			set_stats([10, 10, 10, 10, 10, 10, 10])
			set_arts(["test_attack", "test_defend", ""])
			set_equipment(["", "", ""])
			set_affinities({
				AffinityType.BLUNT : AffinityRate.NEUTRAL,
				AffinityType.PIERCE : AffinityRate.NEUTRAL,
				AffinityType.SLASH : AffinityRate.NEUTRAL,
				AffinityType.FIRE : AffinityRate.NEUTRAL,
				AffinityType.WATER : AffinityRate.NEUTRAL,
				AffinityType.EARTH : AffinityRate.NEUTRAL,
				AffinityType.WIND : AffinityRate.NEUTRAL,
				AffinityType.LIGHT : AffinityRate.NEUTRAL,
				AffinityType.DARK : AffinityRate.NEUTRAL,
			})
		ClassType.THIEF:
			set_stats([10, 10, 10, 10, 10, 10, 10])
			set_arts(["test_attack", "test_defend", ""])
			set_equipment(["", "", ""])
			set_affinities({
				AffinityType.BLUNT : AffinityRate.NEUTRAL,
				AffinityType.PIERCE : AffinityRate.NEUTRAL,
				AffinityType.SLASH : AffinityRate.NEUTRAL,
				AffinityType.FIRE : AffinityRate.NEUTRAL,
				AffinityType.WATER : AffinityRate.NEUTRAL,
				AffinityType.EARTH : AffinityRate.NEUTRAL,
				AffinityType.WIND : AffinityRate.NEUTRAL,
				AffinityType.LIGHT : AffinityRate.NEUTRAL,
				AffinityType.DARK : AffinityRate.NEUTRAL,
			})
		ClassType.MAGE:
			set_stats([10, 10, 10, 10, 10, 10, 10])
			set_arts(["test_attack", "test_defend", ""])
			set_equipment(["", "", ""])
			set_affinities({
				AffinityType.BLUNT : AffinityRate.NEUTRAL,
				AffinityType.PIERCE : AffinityRate.NEUTRAL,
				AffinityType.SLASH : AffinityRate.NEUTRAL,
				AffinityType.FIRE : AffinityRate.NEUTRAL,
				AffinityType.WATER : AffinityRate.NEUTRAL,
				AffinityType.EARTH : AffinityRate.NEUTRAL,
				AffinityType.WIND : AffinityRate.NEUTRAL,
				AffinityType.LIGHT : AffinityRate.NEUTRAL,
				AffinityType.DARK : AffinityRate.NEUTRAL,
			})
		ClassType.CLERIC:
			set_stats([10, 10, 10, 10, 10, 10, 10])
			set_arts(["test_attack", "test_defend", ""])
			set_equipment(["", "", ""])
			set_affinities({
				AffinityType.BLUNT : AffinityRate.NEUTRAL,
				AffinityType.PIERCE : AffinityRate.NEUTRAL,
				AffinityType.SLASH : AffinityRate.NEUTRAL,
				AffinityType.FIRE : AffinityRate.NEUTRAL,
				AffinityType.WATER : AffinityRate.NEUTRAL,
				AffinityType.EARTH : AffinityRate.NEUTRAL,
				AffinityType.WIND : AffinityRate.NEUTRAL,
				AffinityType.LIGHT : AffinityRate.NEUTRAL,
				AffinityType.DARK : AffinityRate.NEUTRAL,
			})
		ClassType.ALCHEMIST:
			set_stats([10, 10, 10, 10, 10, 10, 10])
			set_arts(["test_attack", "test_defend", ""])
			set_equipment(["", "", ""])
			set_affinities({
				AffinityType.BLUNT : AffinityRate.NEUTRAL,
				AffinityType.PIERCE : AffinityRate.NEUTRAL,
				AffinityType.SLASH : AffinityRate.NEUTRAL,
				AffinityType.FIRE : AffinityRate.NEUTRAL,
				AffinityType.WATER : AffinityRate.NEUTRAL,
				AffinityType.EARTH : AffinityRate.NEUTRAL,
				AffinityType.WIND : AffinityRate.NEUTRAL,
				AffinityType.LIGHT : AffinityRate.NEUTRAL,
				AffinityType.DARK : AffinityRate.NEUTRAL,
			})
		ClassType.BARD:
			set_stats([10, 10, 10, 10, 10, 10, 10])
			set_arts(["test_attack", "test_defend", ""])
			set_equipment(["", "", ""])
			set_affinities({
				AffinityType.BLUNT : AffinityRate.NEUTRAL,
				AffinityType.PIERCE : AffinityRate.NEUTRAL,
				AffinityType.SLASH : AffinityRate.NEUTRAL,
				AffinityType.FIRE : AffinityRate.NEUTRAL,
				AffinityType.WATER : AffinityRate.NEUTRAL,
				AffinityType.EARTH : AffinityRate.NEUTRAL,
				AffinityType.WIND : AffinityRate.NEUTRAL,
				AffinityType.LIGHT : AffinityRate.NEUTRAL,
				AffinityType.DARK : AffinityRate.NEUTRAL,
			})
		ClassType.BRAWLER:
			set_stats([10, 10, 10, 10, 10, 10, 10])
			set_arts(["", "", ""])
			set_equipment(["", "", ""])
			set_affinities({
				AffinityType.BLUNT : AffinityRate.NEUTRAL,
				AffinityType.PIERCE : AffinityRate.NEUTRAL,
				AffinityType.SLASH : AffinityRate.NEUTRAL,
				AffinityType.FIRE : AffinityRate.NEUTRAL,
				AffinityType.WATER : AffinityRate.NEUTRAL,
				AffinityType.EARTH : AffinityRate.NEUTRAL,
				AffinityType.WIND : AffinityRate.NEUTRAL,
				AffinityType.LIGHT : AffinityRate.NEUTRAL,
				AffinityType.DARK : AffinityRate.NEUTRAL,
			})
		ClassType.MEDIC:
			set_stats([10, 10, 10, 10, 10, 10, 10])
			set_arts(["", "", ""])
			set_equipment(["", "", ""])
			set_affinities({
				AffinityType.BLUNT : AffinityRate.NEUTRAL,
				AffinityType.PIERCE : AffinityRate.NEUTRAL,
				AffinityType.SLASH : AffinityRate.NEUTRAL,
				AffinityType.FIRE : AffinityRate.NEUTRAL,
				AffinityType.WATER : AffinityRate.NEUTRAL,
				AffinityType.EARTH : AffinityRate.NEUTRAL,
				AffinityType.WIND : AffinityRate.NEUTRAL,
				AffinityType.LIGHT : AffinityRate.NEUTRAL,
				AffinityType.DARK : AffinityRate.NEUTRAL,
			})
		ClassType.CLOWN:
			set_stats([10, 10, 10, 10, 10, 10, 10])
			set_arts(["", "", ""])
			set_equipment(["", "", ""])
			set_affinities({
				AffinityType.BLUNT : AffinityRate.NEUTRAL,
				AffinityType.PIERCE : AffinityRate.NEUTRAL,
				AffinityType.SLASH : AffinityRate.NEUTRAL,
				AffinityType.FIRE : AffinityRate.NEUTRAL,
				AffinityType.WATER : AffinityRate.NEUTRAL,
				AffinityType.EARTH : AffinityRate.NEUTRAL,
				AffinityType.WIND : AffinityRate.NEUTRAL,
				AffinityType.LIGHT : AffinityRate.NEUTRAL,
				AffinityType.DARK : AffinityRate.NEUTRAL,
			})
		ClassType.ARCANIST:
			set_stats([10, 10, 10, 10, 10, 10, 10])
			set_arts(["", "", ""])
			set_equipment(["", "", ""])
			set_affinities({
				AffinityType.BLUNT : AffinityRate.NEUTRAL,
				AffinityType.PIERCE : AffinityRate.NEUTRAL,
				AffinityType.SLASH : AffinityRate.NEUTRAL,
				AffinityType.FIRE : AffinityRate.NEUTRAL,
				AffinityType.WATER : AffinityRate.NEUTRAL,
				AffinityType.EARTH : AffinityRate.NEUTRAL,
				AffinityType.WIND : AffinityRate.NEUTRAL,
				AffinityType.LIGHT : AffinityRate.NEUTRAL,
				AffinityType.DARK : AffinityRate.NEUTRAL,
			})
		ClassType.DRUID:
			set_stats([10, 10, 10, 10, 10, 10, 10])
			set_arts(["", "", ""])
			set_equipment(["", "", ""])
			set_affinities({
				AffinityType.BLUNT : AffinityRate.NEUTRAL,
				AffinityType.PIERCE : AffinityRate.NEUTRAL,
				AffinityType.SLASH : AffinityRate.NEUTRAL,
				AffinityType.FIRE : AffinityRate.NEUTRAL,
				AffinityType.WATER : AffinityRate.NEUTRAL,
				AffinityType.EARTH : AffinityRate.NEUTRAL,
				AffinityType.WIND : AffinityRate.NEUTRAL,
				AffinityType.LIGHT : AffinityRate.NEUTRAL,
				AffinityType.DARK : AffinityRate.NEUTRAL,
			})
		ClassType.SWORDMASTER:
			set_stats([10, 10, 10, 10, 10, 10, 10])
			set_arts(["", "", ""])
			set_equipment(["", "", ""])
			set_affinities({
				AffinityType.BLUNT : AffinityRate.NEUTRAL,
				AffinityType.PIERCE : AffinityRate.NEUTRAL,
				AffinityType.SLASH : AffinityRate.NEUTRAL,
				AffinityType.FIRE : AffinityRate.NEUTRAL,
				AffinityType.WATER : AffinityRate.NEUTRAL,
				AffinityType.EARTH : AffinityRate.NEUTRAL,
				AffinityType.WIND : AffinityRate.NEUTRAL,
				AffinityType.LIGHT : AffinityRate.NEUTRAL,
				AffinityType.DARK : AffinityRate.NEUTRAL,
			})
		ClassType.HORROR:
			set_stats([10, 10, 10, 10, 10, 10, 10])
			set_arts(["", "", ""])
			set_equipment(["", "", ""])
			set_affinities({
				AffinityType.BLUNT : AffinityRate.NEUTRAL,
				AffinityType.PIERCE : AffinityRate.NEUTRAL,
				AffinityType.SLASH : AffinityRate.NEUTRAL,
				AffinityType.FIRE : AffinityRate.NEUTRAL,
				AffinityType.WATER : AffinityRate.NEUTRAL,
				AffinityType.EARTH : AffinityRate.NEUTRAL,
				AffinityType.WIND : AffinityRate.NEUTRAL,
				AffinityType.LIGHT : AffinityRate.NEUTRAL,
				AffinityType.DARK : AffinityRate.NEUTRAL,
			})
		ClassType.WITCH:
			set_stats([10, 10, 10, 10, 10, 10, 10])
			set_arts(["", "", ""])
			set_equipment(["", "", ""])
			set_affinities({
				AffinityType.BLUNT : AffinityRate.NEUTRAL,
				AffinityType.PIERCE : AffinityRate.NEUTRAL,
				AffinityType.SLASH : AffinityRate.NEUTRAL,
				AffinityType.FIRE : AffinityRate.NEUTRAL,
				AffinityType.WATER : AffinityRate.NEUTRAL,
				AffinityType.EARTH : AffinityRate.NEUTRAL,
				AffinityType.WIND : AffinityRate.NEUTRAL,
				AffinityType.LIGHT : AffinityRate.NEUTRAL,
				AffinityType.DARK : AffinityRate.NEUTRAL,
			})

func set_equipment(new_equip: Array[String]):
	if not new_equip[0].is_empty(): equipment[ItemRes.ItemType.WEAPON] = new_equip[0]
	if not new_equip[1].is_empty(): equipment[ItemRes.ItemType.ARMOR] = new_equip[1]
	if not new_equip[2].is_empty(): equipment[ItemRes.ItemType.ACCESSORY] = new_equip[2]

func set_growths(new_growths: Array[String]):
	stat_growths[StatType.HEALTH] = new_growths[0]
	stat_growths[StatType.ARTISTRY] = new_growths[1]
	stat_growths[StatType.ATTACK] = new_growths[2]
	stat_growths[StatType.MAGIC] = new_growths[3]
	stat_growths[StatType.DEFENSE] = new_growths[4]
	stat_growths[StatType.RESISTANCE] = new_growths[5]
	stat_growths[StatType.SPEED] = new_growths[6]

func char_save() -> Dictionary:
	return {
		"act_name": act_name,
		"display_name": display_name,
		"cur_level": cur_level,
		"cur_exp": cur_exp,
		"curHP": curHP,
		"maxHP": maxHP,
		"class_type": class_type,
		"max_exp": max_exp,
		"cur_sp": cur_sp,
		"curAP": curAP,
		"maxAP": maxAP
	}

func char_load(c_data: Dictionary):
	act_name = c_data["act_name"]
	display_name = c_data["display_name"]
	cur_level = c_data["cur_level"]
	cur_exp = c_data["cur_exp"]
	class_type = c_data["class_type"]
	curHP = c_data["curHP"]
	maxHP = c_data["maxHP"]
	max_exp = c_data["max_exp"]
	cur_sp = c_data["cur_sp"]
	curAP = c_data["curAP"]
	maxAP = c_data["maxAP"]

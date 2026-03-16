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

var growths: Dictionary = {
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

func _init(c_name: String, type: ClassType, pos: int = 0, c_data: Dictionary = {}) -> void:
	if c_data.is_empty():
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
	else:
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
		set_stats(c_data["stats"])
		set_arts(c_data["equippedArts"])
		set_other_arts(c_data["arts"])
		set_affinities(c_data["affinities"])
		set_growths(c_data["growths"])
		set_equipment(c_data["equipment"])

## param Array[String]
func set_equipment(new_equip: Array):
	if not new_equip[0].is_empty(): equipment[ItemRes.ItemType.WEAPON] = new_equip[0]
	if not new_equip[1].is_empty(): equipment[ItemRes.ItemType.ARMOR] = new_equip[1]
	if not new_equip[2].is_empty(): equipment[ItemRes.ItemType.ACCESSORY] = new_equip[2]

## param Array[float]
func set_growths(new_growths: Array):
	growths[StatType.HEALTH] = new_growths[0]
	growths[StatType.ARTISTRY] = new_growths[1]
	growths[StatType.ATTACK] = new_growths[2]
	growths[StatType.MAGIC] = new_growths[3]
	growths[StatType.DEFENSE] = new_growths[4]
	growths[StatType.RESISTANCE] = new_growths[5]
	growths[StatType.SPEED] = new_growths[6]

## param Array[String]
func set_other_arts(new_arts: Array):
	pass

func char_save() -> Dictionary:
	return {
		"act_name": act_name,
		"display_name": display_name,
		"cur_level": cur_level,
		"cur_exp": cur_exp,
		"curHP": curHP,
		"maxHP": maxHP,
		"class_type": int(class_type),
		"max_exp": max_exp,
		"cur_sp": cur_sp,
		"curAP": curAP,
		"maxAP": maxAP,
		"stats": [stats[StatType.HEALTH], stats[StatType.ARTISTRY], stats[StatType.ATTACK], stats[StatType.MAGIC], stats[StatType.DEFENSE], stats[StatType.RESISTANCE], stats[StatType.SPEED]],
		"arts": arts,
		"equippedArts": equippedArts,
		"affinities": affinities,
		"growths": [growths[StatType.HEALTH], growths[StatType.ARTISTRY], growths[StatType.ATTACK], growths[StatType.MAGIC], growths[StatType.DEFENSE], growths[StatType.RESISTANCE], growths[StatType.SPEED]],
		"equipment": [equipment[ItemRes.ItemType.WEAPON], equipment[ItemRes.ItemType.ARMOR], equipment[ItemRes.ItemType.ACCESSORY]]
	}

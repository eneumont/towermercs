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

func make_base(c_name: String, type: ClassType) -> CharData:
	var base: CharData = CharData.new()
	base.act_name = str(type) + "" #figure what actual names should be or if needed
	base.display_name = c_name
	base.cur_level = 1
	base.cur_exp = 0
	base.class_type = type
	
	match type:
		ClassType.KNIGHT:
			base.set_stats([10, 10, 10, 10, 10, 10, 10])
			base.set_arts(["", "", ""])
		ClassType.THIEF:
			base.set_stats([10, 10, 10, 10, 10, 10, 10])
			base.set_arts(["", "", ""])
		ClassType.MAGE:
			base.set_stats([10, 10, 10, 10, 10, 10, 10])
			base.set_arts(["", "", ""])
		ClassType.CLERIC:
			base.set_stats([10, 10, 10, 10, 10, 10, 10])
			base.set_arts(["", "", ""])
		ClassType.ALCHEMIST:
			base.set_stats([10, 10, 10, 10, 10, 10, 10])
			base.set_arts(["", "", ""])
		ClassType.BARD:
			base.set_stats([10, 10, 10, 10, 10, 10, 10])
			base.set_arts(["", "", ""])
		ClassType.BRAWLER:
			base.set_stats([10, 10, 10, 10, 10, 10, 10])
			base.set_arts(["", "", ""])
		ClassType.MEDIC:
			base.set_stats([10, 10, 10, 10, 10, 10, 10])
			base.set_arts(["", "", ""])
		ClassType.CLOWN:
			base.set_stats([10, 10, 10, 10, 10, 10, 10])
			base.set_arts(["", "", ""])
		ClassType.ARCANIST:
			base.set_stats([10, 10, 10, 10, 10, 10, 10])
			base.set_arts(["", "", ""])
		ClassType.DRUID:
			base.set_stats([10, 10, 10, 10, 10, 10, 10])
			base.set_arts(["", "", ""])
		ClassType.SWORDMASTER:
			base.set_stats([10, 10, 10, 10, 10, 10, 10])
			base.set_arts(["", "", ""])
		ClassType.HORROR:
			base.set_stats([10, 10, 10, 10, 10, 10, 10])
			base.set_arts(["", "", ""])
		ClassType.WITCH:
			base.set_stats([10, 10, 10, 10, 10, 10, 10])
			base.set_arts(["", "", ""])
	
	return base

func set_equipment(new_equip: Array[String]):
	if not new_equip[0].is_empty(): equipment[ItemRes.ItemType.WEAPON] = new_equip[0]
	if not new_equip[1].is_empty(): equipment[ItemRes.ItemType.ARMOR] = new_equip[1]
	if not new_equip[2].is_empty(): equipment[ItemRes.ItemType.ACCESSORY] = new_equip[2]

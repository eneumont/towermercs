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

var next_exp: int
var max_exp: int
var cur_sp: int
var class_type: ClassType
var curAP: int = 5
var maxAP: int = 10

#fuck...
#also setup based on class...
#FUCK!!!
var stat_growths: Dictionary = {
	1 : [],
	2 : [],
	3 : [],
	4 : [],
	5 : [],
}

var arts: Array = [
	
]

var equipment: Dictionary = {
	ItemRes.ItemType.WEAPON : "",
	ItemRes.ItemType.ARMOR : "",
	ItemRes.ItemType.ACCESSORY : "",
}

func _init(c_name: String, type: ClassType, c_data: Dictionary = {}) -> void:
	if c_data.is_empty():
		act_name = assign_name(type)
		display_name = c_name
		cur_level = 1
		cur_exp = 0
		class_type = type
		
		# HP, AP, ATK, MAG, DEF, RES, SPD, * 24, * 6, * 9, MAX_EXP
		match type:
			ClassType.KNIGHT:
				set_growths([
					[11, 8, 11, 9, 13, 9, 8, 10],
					[14, 9, 14, 9, 17, 10, 9, 25],
					[18, 11, 16, 11, 22, 12, 11, 50],
					[20, 13, 19, 15, 26, 13, 13, 125],
					[25, 15, 22, 17, 28, 16, 15, 300]
				])
				set_arts(["test_attack", "test_defend", ""])
				set_other_arts(["knight_art01, knight_art02, knight_art03"])
				set_equipment(["sword_shield_1", "heavy_armor_1", "hairpin_1"])
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
				set_growths([
					[9, 10, 10, 9, 8, 8, 13, 10],
					[11, 13, 11, 10, 10, 10, 17, 25],
					[13, 15, 12, 12, 11, 11, 20, 50],
					[16, 18, 15, 15, 14, 14, 22, 125],
					[18, 20, 17, 17, 15, 15, 25, 300]
				])
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
				set_growths([
					[8, 13, 7, 13, 7, 8, 10, 10],
					[10, 17, 9, 18, 9, 9, 13, 25],
					[13, 22, 10, 24, 10, 10, 15, 50],
					[15, 25, 12, 27, 13, 13, 17, 125],
					[18, 27, 15, 30, 16, 16, 20, 300]
				])
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
				set_growths([
					[10, 11, 9, 11, 8, 10, 10, 10],
					[12, 14, 11, 14, 10, 11, 11, 25],
					[15, 17, 14, 17, 12, 14, 14, 50],
					[17, 20, 16, 20, 15, 16, 16, 125],
					[20, 22, 18, 22, 18, 19, 18, 300]
				])
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
		
		set_stats(stat_growths[cur_level])
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
		set_stats(c_data["stats"] + [max_exp]) #maybe change? 
		set_arts(c_data["equippedArts"])
		set_other_arts(c_data["arts"])
		set_affinities(c_data["affinities"])
		set_growths(c_data["growths"])
		set_equipment(c_data["equipment"])

## param Array[String] [br]
## weapon, armor, accessory
func set_equipment(new_equip: Array):
	if not new_equip[0].is_empty(): equipment[ItemRes.ItemType.WEAPON] = new_equip[0]
	if not new_equip[1].is_empty(): equipment[ItemRes.ItemType.ARMOR] = new_equip[1]
	if not new_equip[2].is_empty(): equipment[ItemRes.ItemType.ACCESSORY] = new_equip[2]

## param Array[Array[ints]]
func set_growths(new_growths: Array):
	for g in stat_growths:
		stat_growths[g] = new_growths[g - 1] 

#could change how much multiplied based on level...
## *24 *6  *9                                                                     none [br]
## HP, AP, ATK, MAG, DEF, RES, SPD, (Acu, Eva, Crit), MAX_EXP
func set_stats(new_stats: Array):
	stats[StatType.HEALTH] = new_stats[0]
	stats[StatType.ARTISTRY] = new_stats[1]
	stats[StatType.ATTACK] = new_stats[2]
	stats[StatType.MAGIC] = new_stats[3]
	stats[StatType.DEFENSE] = new_stats[4]
	stats[StatType.RESISTANCE] = new_stats[5]
	stats[StatType.SPEED] = new_stats[6]
	#stats[StatType.ACCURACY] = new_stats[7]
	#stats[StatType.EVASION] = new_stats[8]
	#stats[StatType.CRITICAL] = new_stats[9]
	max_exp = new_stats[7] #new_stats[10]
	maxHP = stats[BeingData.StatType.HEALTH]
	curHP = maxHP
	maxAP = stats[StatType.ARTISTRY]
	curAP = maxAP

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
		"growths": [stat_growths[1], stat_growths[2], stat_growths[3], stat_growths[4], stat_growths[5]], #extend to 100...
		"equipment": [equipment[ItemRes.ItemType.WEAPON], equipment[ItemRes.ItemType.ARMOR], equipment[ItemRes.ItemType.ACCESSORY]]
	}

## assigns name by type and then next avaible number [br]
## ex. if creating knight and Knight1 exists then creates Knight2
func assign_name(type: ClassType) -> String:
	var out: String = ClassType.keys()[type] #returns KNIGHT, MAGE, etc. note for multiplayer specifically mutliple user partys, temporary add owner name to act name
	
	var nums: Array[int]
	
	#see if can reduce this to single line of just nums = array of ints 
	#that are the same class but partioned off act_name
	var c_array: Array[CharData]
	#whether or not they're dependent instances doesn't matter since only pulling data
	c_array.append_array(PlayerData.collection)
	c_array.append_array(PlayerData.party)
	c_array.append_array(PlayerData.reserve)
	for c in c_array.filter(func(t): return t.class_type == type):
		nums.append(c.act_name.to_int()) #remove all letters
	
	if nums.is_empty(): return out + "0"
	
	nums.sort()
	
	#this shit is not efficient...  imma have to do regex...
	for i in nums.size():
		#maybe turn to ternary...
		if i == nums.size() - 1: #if at end add one
			out = out + str(nums[i] + 1)
			break
		else:
			if (nums[i + 1] - nums[i]) <= 1: #if dif between cur and next is 1 or less continue
				continue
			else: #otherwise add one to cur
				out = out + str(nums[i] + 1)
				break
	
	return out

func gain_rewards(exp: int, sp: int):
	if cur_level < 100:
		next_exp += exp
		if next_exp >= max_exp:
			while (next_exp >= max_exp):
				next_exp = next_exp - max_exp
				cur_level += 1
			set_stats(stat_growths[cur_level])
			if cur_level == 100: cur_exp = max_exp
	
	if cur_sp < 9999: 
		cur_sp += sp
		if cur_sp > 9999: cur_sp = 9999

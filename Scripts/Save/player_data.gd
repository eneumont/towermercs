extends Node

var money: int = 100
var inventory: Dictionary

var party: Array[CharData] = [
	CharData.new().make_base("Test1", CharData.ClassType.MAGE),
	CharData.new().make_base("Test2", CharData.ClassType.THIEF),
	CharData.new().make_base("Test3", CharData.ClassType.KNIGHT),
	CharData.new().make_base("Test4", CharData.ClassType.CLERIC)
]
var collection: Array[CharData] = []
var available_classes: Array[CharData.ClassType] = [ 
	CharData.ClassType.KNIGHT, 
	CharData.ClassType.THIEF, 
	CharData.ClassType.MAGE, 
	CharData.ClassType.CLERIC 
]

var player_pos: Vector3 = Vector3(0, 0, 0)
var cur_scn: String = "WorldMap/WorldMap.tscn"

var ui_open: bool = false

func save() -> Dictionary:
	return {
		"money": money,
		"inventory": inventory,
		"party": party,
		"collection": collection,
		"available_classes": available_classes,
		"player_pos": player_pos,
		"cur_scn": cur_scn,
		"ui_open": ui_open,
	}

extends Node

var money: int = 100 #0
var inventory: Dictionary

var party: Array[CharData] = [
	CharData.new("Test1", CharData.ClassType.MAGE),
	CharData.new("Test2", CharData.ClassType.THIEF),
	CharData.new("Test3", CharData.ClassType.KNIGHT),
	CharData.new("Test4", CharData.ClassType.CLERIC)
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
var foes: Dictionary

var ui_open: bool = false

var loadin: bool = false

func save() -> Dictionary:
	return {
		"money": money,
		"inventory": inventory,
		"party": party,
		"collection": collection,
		"available_classes": available_classes,
		"player_pos": player_pos,
		"cur_scn": cur_scn,
		"foes": foes,
		"ui_open": ui_open,
		"loadin": loadin,
	}

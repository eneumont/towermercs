extends Node

var s_name: String = ""
var time: String = ""
var money: int = 100 #0
var inventory: Dictionary[String, int]

var party: Array[CharData] = [
	CharData.new("Test1", CharData.ClassType.MAGE),
	CharData.new("Test2", CharData.ClassType.THIEF),
	CharData.new("Test3", CharData.ClassType.KNIGHT),
	CharData.new("Test4", CharData.ClassType.CLERIC),
]
var reserve: Array[CharData] = [
	CharData.new("Test5", CharData.ClassType.CLERIC),
	CharData.new("Test6", CharData.ClassType.THIEF),
	CharData.new("Test7", CharData.ClassType.KNIGHT),
]
var collection: Array[CharData] = []
var available_classes: Array[CharData.ClassType] = [ 
	CharData.ClassType.KNIGHT, 
	CharData.ClassType.THIEF, 
	CharData.ClassType.MAGE, 
	CharData.ClassType.CLERIC, 
]

var player_pos: Vector3 = Vector3(0, 0, 0)
var cur_scn: String = "WorldMap/WorldMap"
var foes: Dictionary

var ui_open: bool = false

var loadin: bool = false

func save() -> Dictionary:
	#get player pos
	
	return {
		"name": s_name,
		"time": time,
		"money": money,
		"inventory": inventory,
		"party": party,
		"reserve": reserve,
		"collection": collection,
		"available_classes": available_classes,
		"player_pos": player_pos,
		"cur_scn": cur_scn,
		"foes": foes,
		"ui_open": ui_open,
		"loadin": loadin,
	}

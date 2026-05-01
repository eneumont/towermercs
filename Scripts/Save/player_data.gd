extends Node

var s_name: String = ""
var time: String = ""
var money: int = 100 #0
var inventory: Dictionary #[String, int]

var party: Array[CharData] = [
	#CharData.new("Test1", CharData.ClassType.MAGE),
	#CharData.new("Test2", CharData.ClassType.THIEF),
	#CharData.new("Test3", CharData.ClassType.KNIGHT),
	#CharData.new("Test4", CharData.ClassType.CLERIC),
]
var reserve: Array[CharData] = [
	#CharData.new("Test5", CharData.ClassType.CLERIC),
	#CharData.new("Test6", CharData.ClassType.THIEF),
]
var collection: Array[CharData] = []
var available_classes: Array = [ ##Array[CharData.ClassType]
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
		"party": data_array(party),
		"reserve": data_array(reserve),
		"collection": data_array(collection),
		"available_classes": available_classes,
		"player_pos": player_pos,
		"cur_scn": cur_scn,
		"foes": foes,
		#"ui_open": ui_open,dont think ui_open is needed
		"loadin": loadin,
	}

func load_save(data: Dictionary):
	s_name = data["name"]
	time = data["time"]
	money = data["money"]
	inventory = data["inventory"]
	party = array_to_data(data["party"])
	reserve = array_to_data(data["reserve"])
	collection = array_to_data(data["collection"])
	available_classes = data["available_classes"]
	var a = data["player_pos"].replace("(", "").replace(")", "").split(", ", false)
	player_pos = Vector3(float(a[0]), float(a[1]), float(a[2]))
	cur_scn = data["cur_scn"]
	foes = data["foes"]
	loadin = data["loadin"]

func data_array(c_array: Array[CharData]) -> Array:
	var out := []
	
	for c in c_array:
		out.append(c.char_save())
	
	return out

func array_to_data(arr: Array) -> Array[CharData]:
	var out: Array[CharData] = []
	
	for c in arr:
		out.append(CharData.new("", 0 as CharData.ClassType, c))
	
	return out

##remeber this should be same as default
func reset():
	s_name = ""
	time = ""
	money = 100 #0
	inventory.clear()
	
	party.clear()
	reserve.clear()
	collection.clear()
	available_classes.clear()
	
	player_pos = Vector3(0, 0, 0)
	cur_scn = "WorldMap/WorldMap"
	foes.clear()
	
	ui_open = false
	loadin = false

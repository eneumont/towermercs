extends Resource
class_name ArtRes

@export var act_name: String
@export var display_name: String
@export var power: float
@export var range: Array[int]
@export var hp_cost: int
@export var ap_cost: int
#status @export var status: Array[Status]
@export var accuracy: float
@export var critical: float
@export var group: GroupType
@export var team: TargetTeam
@export var anim: String
@export var crit_art: String
#whether to stay in place or move to target, or just have when doing action move slightly forward

enum GroupType {
	SINGLE,
	TEAM,
	ALL,
}

enum TargetTeam {
	ALLY,
	FOE,
	ALL,
}

func cast():
	pass

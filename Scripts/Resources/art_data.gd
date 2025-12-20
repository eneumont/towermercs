extends Resource
class_name ArtRes

@export var act_name: String
@export var display_name: String
@export var power: float
@export var range: Array[int]
@export var hp_cost: int
@export var ap_cost: int
@export var status: Array[StatusRes]
@export var accuracy: float
@export var critical: float
@export var group: GroupType
@export var team: TargetTeam
@export var type: ArtType
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

enum ArtType {
	ATTACK,
	MAGIC,
	DEFEND,
	ITEM,
	RUN,
}

func cast():
	#move character forward
	match (type):
		ArtType.ATTACK:
			pass
		ArtType.MAGIC:
			pass
		ArtType.DEFEND:
			pass
		ArtType.ITEM:
			pass
		ArtType.RUN:
			pass

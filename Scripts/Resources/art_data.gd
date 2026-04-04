extends Resource
class_name ArtRes

@export var id: String
@export var display_name: String
@export var power: float
@export var ranges: Array[int]
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
@export var description: String
@export var feedback: String

enum GroupType {
	SINGLE,
	TEAM,
	ALL,
}

enum TargetTeam {
	ALLY,
	FOE,
	ALL,
	SELF,
}

enum ArtType {
	ATTACK,
	MAGIC,
	DEFEND,
	ITEM,
	RUN,
}

func cast(caster: Battler, targets: Array) -> String:
	var out := feedback
	#move character forward if player otherwise make foe flash?
	
	#check crit here and do crit logic
	
	match (type):
		ArtType.ATTACK:
			attack_cast(caster, targets)
		ArtType.MAGIC:
			magic_cast(caster, targets)
		ArtType.DEFEND:
			defend_cast(caster, targets)
		ArtType.ITEM:
			item_cast(caster, targets)
		ArtType.RUN:
			run_cast(caster, targets)
			
	caster.set_cur_stats()
	for t in targets:
		t.set_cur_stats()
	return out

func attack_cast(caster: Battler, targets: Array, crit: bool = false):
	print("attack")
	for t in targets:
		t.take_damage(-5)

func magic_cast(caster: Battler, targets: Array, crit: bool = false):
	print("magic")
	for t in targets:
		t.take_damage(5)
	
func defend_cast(caster: Battler, targets: Array):
	print("defend")
	caster.defending = true
	
func item_cast(caster: Battler, targets: Array):
	print("item")
	
func run_cast(caster: Battler, targets: Array):
	print("run")

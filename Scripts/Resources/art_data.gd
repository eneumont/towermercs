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
	
	caster.curHP -= hp_cost
	if caster.player == Battler.Player.PLAYER: caster.curAP -= ap_cost
	
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
	if caster.team == Battler.Team.ALLY: caster.play_anim("attack") 
	else: caster.anim_tree.set("parameters/atk_shot/request", AnimationNodeOneShot.ONE_SHOT_REQUEST_FIRE)
	
	for t in targets:
		t.take_damage(-5)

func magic_cast(caster: Battler, targets: Array, crit: bool = false):
	if caster.team == Battler.Team.ALLY: caster.play_anim("skill") 
	else: caster.anim_tree.set("parameters/skill_shot/request", AnimationNodeOneShot.ONE_SHOT_REQUEST_FIRE)
	
	for t in targets:
		t.take_damage(5)
	
func defend_cast(caster: Battler, targets: Array):
	if caster.team == Battler.Team.ALLY: caster.play_anim("guard") 
	else: caster.anim_tree.set("parameters/skill_shot/request", AnimationNodeOneShot.ONE_SHOT_REQUEST_FIRE) #maybe tweak
	
	caster.defending = true
	
func item_cast(caster: Battler, targets: Array):
	if caster.team == Battler.Team.ALLY: caster.play_anim("item") 
	else: caster.anim_tree.set("parameters/skill_shot/request", AnimationNodeOneShot.ONE_SHOT_REQUEST_FIRE) #maybe tweak
	
func run_cast(caster: Battler, targets: Array):
	if caster.team == Battler.Team.ALLY: caster.play_anim("run") 
	else: caster.anim_tree.set("parameters/skill_shot/request", AnimationNodeOneShot.ONE_SHOT_REQUEST_FIRE) #maybe tweak

func field_cast(caster: CharData, targets: Array) -> String:
	if caster.curHP == 0 or caster.curHP - hp_cost <= 0 or caster.cur_ap - ap_cost < 0:
		return "NAME can't..."
		
	caster.curHP -= hp_cost
	caster.curAP -= ap_cost
	
	#cast logic
	
	return "NAME cast " + display_name + "!"

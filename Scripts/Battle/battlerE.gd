extends Battler
class_name BattlerE

var money: int = 0
var anim_tree: AnimationTree

func create(is_player: bool, data, control: Controller = Controller.NONE) -> void:
	super(is_player, data, control)
	money = data.money
	var model = data.model.instantiate()
	add_child(model)
	model.position = data.pos
	model.rotation = Vector3(0, -90, 0)
	model.scale = data.sca
	anim_tree = model.get_node("AnimationTree")

func start_turn():
	super()
	
	var select_art := ArtDatabase.get_art(arts[randi_range(0, arts.size() - 1)])
	var select_targets: Array
	
	match select_art.team:
		ArtRes.TargetTeam.ALL:
			select_targets = bm.aliveBattlers
		ArtRes.TargetTeam.ALLY:
			select_targets = bm.aliveBattlers.filter(func(b): return b.team == Team.FOE)
		ArtRes.TargetTeam.FOE:
			select_targets = bm.aliveBattlers.filter(func(b): return b.team == Team.ALLY)
		ArtRes.TargetTeam.SELF:
			select_targets = bm.aliveBattlers.filter(func(b): return b == self)

	if (select_art.team != ArtRes.TargetTeam.SELF && select_art.group == ArtRes.GroupType.SINGLE):
		select_targets = [select_targets[randi_range(0, select_targets.size() - 1)]]
	
	bm.casted_art = select_art.id
	bm.targets.append_array(select_targets)
	bm.cast()
	
	# update selector ui
	bm.cur_turn.selector.get_node("SubViewport/SelectUI/VBox/SelectHP").value = 100.0 * (float(bm.cur_turn.curHP) / bm.cur_turn.maxHP)
	for b in bm.targets:
		b.selector.get_node("SubViewport/SelectUI/VBox/SelectHP").value = 100.0 * (float(b.curHP) / b.maxHP)
	
	end_turn()

func end_turn():
	super()

func take_damage(dmg: int):
	anim_tree.set("parameters/hit_shot/request", AnimationNodeOneShot.ONE_SHOT_REQUEST_FIRE)
	super(dmg)

func die():
	anim_tree.set("parameters/ld_blend/blend_amount", 1.0)
	bm.money_won += money
	super()

extends Battler
class_name BattlerE

var money: int = 0

func create(is_player: bool, data, control: Controller = Controller.NONE) -> void:
	super(is_player, data, control)
	money = data.money
	var model = data.model.instantiate()
	add_child(model)
	model.position = data.pos
	model.rotation = data.rot
	model.scale = data.sca

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

func die():
	bm.money_won += money
	super()

extends Battler
class_name BattlerE

func start_turn():
	super()
	
	var select_art := ArtDatabase.get_art(arts[randi_range(0, arts.size() - 1)])
	var select_targets
	
	match select_art.team:
		ArtRes.TargetTeam.ALL:
			select_targets = bm.aliveBattlers
		ArtRes.TargetTeam.ALLY:
			select_targets = bm.aliveBattlers.filter(func(b): return b.team == Team.FOE)
		ArtRes.TargetTeam.FOE:
			select_targets = bm.aliveBattlers.filter(func(b): return b.team == Team.ALLY)

	if (select_art.group == ArtRes.GroupType.SINGLE):
		select_targets = select_targets[randi_range(0, select_targets.size() - 1)]
	
	select_art.cast(self, select_targets)

func end_turn():
	super()

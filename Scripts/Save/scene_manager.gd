extends Node

var encounter: String

var stack: Array[Node] = []

func push_scene(path: String):
	var cur := get_tree().current_scene
	if cur:
		cur.process_mode = Node.PROCESS_MODE_PAUSABLE
		cur.set_process(false)
		cur.set_physics_process(false)
		cur.set_process_input(false)
		
		stack.append(cur)
		get_tree().root.call_deferred("remove_child", cur)
		
	var next_scn = load(path).instantiate()
	get_tree().root.add_child(next_scn)
	get_tree().current_scene = next_scn
	
func pop_scene():
	var cur := get_tree().current_scene
	if cur:
		cur.queue_free()
		
	if stack.is_empty():
		return
	
	var pre = stack.pop_back()
	get_tree().root.add_child(pre)
	
	pre.process_mode = Node.PROCESS_MODE_INHERIT
	pre.set_process(true)
	pre.set_physics_process(true)
	pre.set_process_input(true)
	
	get_tree().current_scene = pre

##saving note 0 -> auto, 1,2,3 -> regular
func new_scene(next: String, pos: Vector3 = Vector3.ZERO):
	get_tree().change_scene_to_file("res://Scenes/" + next + ".tscn")
	PlayerData.cur_scn = next
	PlayerData.player_pos = pos
	SaveManager.save_game(0, PlayerData.save(), true)

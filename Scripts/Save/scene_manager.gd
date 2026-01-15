extends Node
class_name SceneManager

var stack: Array[Node] = []

func push_scene(path: String):
	var cur := get_tree().current_scene
	if cur:
		cur.paused = true
		cur.set_process(false)
		cur.set_physics_process(false)
		cur.set_process_input(false)
		
		stack.append(cur)
		get_tree().root.remove_child(cur)
		
	var next_scn := load(path).instantiate()
	get_tree().root.add_child(next_scn)
	get_tree().current_scene = next_scn
	
func pop_scene():
	pass

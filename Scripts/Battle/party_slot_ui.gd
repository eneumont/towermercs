extends Control

@export var num: int

func update_self():
	var player = PlayerData.party[num]
	$Slot/HBox/Info/Name.text = player.display_name

extends Control

var bm

@export var num: int

func update_self():
	var player: BattlerP = bm.PlayerBattlers[num]
	$Slot/HBox/Info/Name.text = player.displayName
	$Slot/HBox/Info/HPBar/HPText.text = "HP " + str(player.maxHP) + "/" + str(player.curHP)
	$Slot/HBox/Info/APBar/APText.text = "AP " + str(player.maxAP) + "/" + str(player.curAP)
	$Slot/HBox/Info/HPBar.value = 100 * (player.curHP / player.maxHP)
	$Slot/HBox/Info/APBar.value = 100 * (player.curAP / player.maxAP)
	$Slot/HBox/Img.texture = load("res://Images/Textures/Icons/Characters/" + CharData.ClassType.keys()[bm.PlayerBattlers[num].classType].capitalize() + ".png")

extends Control

var bm

@export var num: int

func update_self():
	var player: BattlerP = bm.PlayerBattlers[num]
	$Slot/HBox/Info/Name.text = player.displayName
	$Slot/HBox/Info/HPBar/HPText.text = "HP " + str(player.stats[CharData.StatType.HEALTH] * player.modifiers[CharData.StatType.HEALTH]) + "/" + str(player.currentStats[CharData.StatType.HEALTH])
	$Slot/HBox/Info/APBar/APText.text = "AP " + str(player.stats[CharData.StatType.ARTISTRY] * player.modifiers[CharData.StatType.ARTISTRY]) + "/" + str(player.currentStats[CharData.StatType.ARTISTRY])
	$Slot/HBox/Info/HPBar.value = 100 * (player.currentStats[CharData.StatType.HEALTH] / (player.stats[CharData.StatType.HEALTH] * player.modifiers[CharData.StatType.HEALTH]))
	$Slot/HBox/Info/APBar.value = 100 * (player.currentStats[CharData.StatType.ARTISTRY] / (player.stats[CharData.StatType.ARTISTRY] * player.modifiers[CharData.StatType.ARTISTRY]))

func update_image():
	var player: BattlerP = bm.PlayerBattlers[num]
	var img: Texture2D
	#may have to tweak this for performance
	match player.classType:
		CharData.ClassType.KNIGHT:
			img = load("res://Images/Textures/Icons/Characters/Knight.png")
		CharData.ClassType.THIEF:
			img = load("res://Images/Textures/Icons/Characters/Thief.png")
		CharData.ClassType.MAGE:
			img = load("res://Images/Textures/Icons/Characters/Mage.png")
		CharData.ClassType.CLERIC:
			img = load("res://Images/Textures/Icons/Characters/Cleric.png")
		CharData.ClassType.BARD:
			pass
		CharData.ClassType.BRAWLER:
			pass
		CharData.ClassType.ALCHEMIST:
			pass
		CharData.ClassType.MEDIC:
			pass
		CharData.ClassType.CLOWN:
			pass
		CharData.ClassType.ARCANIST:
			pass
		CharData.ClassType.DRUID:
			pass
		CharData.ClassType.SWORDMASTER:
			pass
		CharData.ClassType.HORROR:
			pass
		CharData.ClassType.WITCH:
			pass
	
	$Slot/HBox/Img.texture = img

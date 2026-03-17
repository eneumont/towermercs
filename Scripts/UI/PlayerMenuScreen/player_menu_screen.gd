extends Control

@onready var time_txt: Label = $TimeTxt
@onready var money_txt: Label = $MoneyTxt

func design():
	time_txt.txt = "Time: " + PlayerData.time
	money_txt.text = "Money: " + str(PlayerData.money)

extends Control

var id: String

func setup():
	var i_data := ItemDatabase.get_item(id)
	
	$VBox/HBox/NameTxt.text = i_data.name
	$VBox/HBox/Pic.texture = load("res://Images/Textures/Icons/Items/" + i_data.pic)
	$VBox/StatsTxt.text = i_data.description

func click():
	pass

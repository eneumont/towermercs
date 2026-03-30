extends Button

var id: String

func setup():
	var i_data := ItemDatabase.get_item(id)
	if i_data != null:
		$VBox/HBox/NameTxt.text = i_data.name
		$VBox/HBox/Pic.texture = load("res://Images/Textures/Icons/Items/" + i_data.pic)
		$VBox/StatsTxt.text = i_data.description
	else:
		$VBox/HBox/NameTxt.text = ""
		$VBox/HBox/Pic.texture = null
		$VBox/StatsTxt.text = ""

func click():
	pass

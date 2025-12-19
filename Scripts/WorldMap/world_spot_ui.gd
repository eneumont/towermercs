extends Node
class_name SpotUI

@onready var spotIcon: TextureRect = $Icon
@onready var spotName: Label = $NameBg/Name
@onready var spotDescription: Label = $DescriptionBg/Description

func set_values(display: String, description: String, icon: Texture) -> void:
	spotIcon.texture = icon
	spotDescription.text = description
	spotName.text = display

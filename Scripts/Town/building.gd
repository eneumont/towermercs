extends Node3D
class_name Building

@export var ownerName: String
@export var ownerPic: Texture
@export var ownerDialogue: Dictionary = {}
@export var ownerRespones: Dictionary = {}

@export var BuildingUI: BuildingUI

func _ready() -> void:
	setup()

func _process(delta: float) -> void:
	pass

func _on_area_3d_body_entered(body: Node3D) -> void:
	if body is CharacterBody3D:
		body.building = self

func _on_area_3d_body_exited(body: Node3D) -> void:
	if body is CharacterBody3D:
		body.building = null

func setup():
	BuildingUI.building = self
	BuildingUI.ownerName = ownerName
	BuildingUI.ownerPic = ownerPic
	BuildingUI.ownerDialogue = ownerDialogue
	BuildingUI.ownerRespones = ownerRespones
	BuildingUI.setup()
	closeUI()

func openUI():
	BuildingUI.show()
	BuildingUI.set_process(true)
	BuildingUI.updateMoney()
	PlayerData.ui_open = true
	
func closeUI():
	BuildingUI.hide()
	BuildingUI.set_process(false)
	PlayerData.ui_open = false

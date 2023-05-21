extends Node2D

@onready var first_id = $PanelContainer/First_id

func _ready():
	first_id.pressed.connect(_on_first_id_pressed)
	
func _on_first_id_pressed():
	get_tree().change_scene_to_file("res://scenes/npc_card.tscn")           

extends Node2D
@onready var main_menu = $MenuContainer/MainMenu


# Called when the node enters the scene tree for the first time.
func _ready():
	main_menu.pressed.connect(_on_main_menu_pressed)
	
func _on_main_menu_pressed():
	get_tree().change_scene_to_file("res://ui/main_menu.tscn")

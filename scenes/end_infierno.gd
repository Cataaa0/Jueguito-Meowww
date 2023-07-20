extends Node2D
@onready var menu = $menu


func _ready():
	menu.pressed.connect(_on_menu_pressed)


func _on_menu_pressed():
	get_tree().change_scene_to_file("res://ui/main_menu.tscn")
# Called every frame. 'delta' is the elapsed time since the previous frame.

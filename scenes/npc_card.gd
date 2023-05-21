extends TileMap
@onready var room = $Background/RetryButton/MarginContainer/Room

func _ready():
	room.pressed.connect(_on_room_pressed)
	
func _on_room_pressed():
	get_tree().change_scene_to_file("res://scenes/room.tscn")

#@export var cat_names: Array [String]
#@onready var text_box_container = $Background/CanvasLayer/TextBoxContainer

# Called when the node enters the scene tree for the first time.
#func _ready():
#	hide_textbox()# Replace with function body.

#func hide_textbox():
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func show_textbox():
#	textbox_container.show()

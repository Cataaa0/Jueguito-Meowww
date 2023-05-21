extends MarginContainer
@onready var memories = $Memories


func _ready():
	memories.pressed.connect(_on_memories_pressed)
	
func _on_memories_pressed():
	get_tree().change_scene_to_file("res://scenes/room.tscn")

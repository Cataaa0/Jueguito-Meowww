extends MarginContainer
@onready var memories = $Memories
#@export var node :Node


func _ready():
	memories.pressed.connect(_on_memories_pressed)
#	hide()
	
#func _on_button_entered():
#	if body.has_method("talk"):
#		visible=!visible
#		get_tree().paused = visible
	
func _on_memories_pressed():
	get_tree().change_scene_to_file("res://scenes/room.tscn")

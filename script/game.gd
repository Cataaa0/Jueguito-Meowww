extends Node

var player
@export var room_scene : PackedScene
var room

func show_room():
	room = room_scene.instantiate()
	add_sibling(room)
	get_tree().paused = true
	
func hide_room():
	room.get_parent().remove_child(room)
	room.queue_free()
	room = null
	get_tree().paused = false


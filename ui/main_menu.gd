extends MarginContainer
@onready var start = %Start
@onready var exit = %Exit
@onready var credits = %Credits


# Called when the node enters the scene tree for the first time.
func _ready():
	start.pressed.connect(_on_start_pressed)
	exit.pressed.connect(_on_exit_pressed)
	credits.pressed.connect(_on_credits_pressed)
	
func _on_start_pressed():
	get_tree().change_scene_to_file("res://scenes/main.tscn")

func _on_exit_pressed():
	get_tree().quit()
	
func _on_credits_pressed():
	get_tree().change_scene_to_file("res://scenes/credits.tscn")
# Called every frame. 'delta' is the elapsed time since the previous frame.

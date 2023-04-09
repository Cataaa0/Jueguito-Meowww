extends MarginContainer

@onready var resume = %Resume
@onready var retry = %Retry
@onready var main_menu = %MainMenu


# Called when the node enters the scene tree for the first time.
func _ready():
	resume.pressed.connect(on_resume_pressed)
	retry.pressed.connect(on_retry_pressed)
	main_menu.pressed.connect(on_main_menu_pressed)
	hide()

func _input(event):
	if event.is_action_pressed("pause"):
		visible=!visible
		get_tree().paused = visible
		
func on_resume_pressed():
	get_tree().paused = false
	hide()

func on_retry_pressed():
	get_tree().reload_current_scene()
	get_tree().paused = false

func on_main_menu_pressed():
	get_tree().change_scene_to_file("res://ui/main_menu.tscn")
	get_tree().paused = false

extends CanvasLayer

@onready var first_id = $PanelContainer/First_id
@onready var go_back = $PanelContainer/Go_back

func _ready():
	first_id.pressed.connect(_on_first_id_pressed)
	go_back.pressed.connect(_on_go_back_pressed)
	
func _on_first_id_pressed():
	#get_tree().paused = true
	get_tree().change_scene_to_file("res://scenes/npc_card.tscn")
	#get_tree().paused = visible      
	
func _on_go_back_pressed():
	#get_tree().change_scene_to_file("res://scenes/main.tscn")
	#get_tree().paused = true
	#visible!=visible
	Game.hide_room()
		
func _input(event):
	if event.is_action_pressed("anti_interact"):
		_on_go_back_pressed()
		
	

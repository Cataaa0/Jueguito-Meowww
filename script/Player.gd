extends CharacterBody2D
class_name Player
const SPEED = 140.0
const JUMP_VELOCITY = -200.0
const GRAVITY = 600
const ACCELERATION = 1000

@onready var pivot = $Pivot
@onready var animatiojn_player = $AnimationPlayer
@onready var animation_tree = $AnimationTree
@onready var playback = animation_tree.get("parameters/playback")
@onready var camera_2d = $Camera2D
@onready var audio_stream_player = $AudioStreamPlayer
@onready var talk_area = $Pivot/TalkArea


var talk_area_array = []

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += GRAVITY * delta

	# Handle Jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		jump()
	
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var move_input = Input.get_axis("move_left", "move_right")
	velocity.x = move_toward(velocity.x, move_input * SPEED, ACCELERATION * delta)

#	if Input.is_action_just_pressed("interact"):
#		if talk_area_array.size():
#			var closest = talk_area_array[0]
#			var closest_distance = abs(closest.global_position.x - global_position.x)
#			for body in talk_area_array:
#				var body_distance = abs(body.global_position.x - global_position.x)
#				if body_distance < closest_distance:
#					closest = body
#			if closest.has_method("talk"):
#				closest.talk()

	move_and_slide()
	var dead_limit = get_tree().get_nodes_in_group("dead_limit")[0].global_position
	var spawn_init = get_tree().get_nodes_in_group("spawn_init")[0].global_position
	if global_position.y > dead_limit.y + 10:
		global_position.y = spawn_init.y
		global_position.x = spawn_init.x
	

	
	#Animation
	if move_input:
		pivot.scale.x = sign(move_input)

	if is_on_floor():
		if abs(velocity.x) > 10:
			playback.travel("run")
		else:
			playback.travel("idle")
	else:
		if velocity.y<=0:
			playback.travel("jump")
		else:
			playback.travel("jump_end")

func jump():
	velocity.y = JUMP_VELOCITY
	audio_stream_player.play()

func set_camera_limit(sup_izq: Vector2,inf_der: Vector2):
	camera_2d.limit_bottom = inf_der.y
	camera_2d.limit_left = sup_izq.x
	camera_2d.limit_right = inf_der.x
	camera_2d.limit_top = sup_izq.y


func _ready():
	talk_area.body_entered.connect(_on_talk_entered)
	talk_area.body_exited.connect(_on_talk_exited)

func _on_talk_entered(body:Node):  #para ocupar boton, borrar esta funcion y descomentar lo comentado
	if body.has_method("talk") and Input.is_action_just_pressed("interact"):
		body.talk()
		
func _on_talk_exited(body:Node):  #para ocupar boton, borrar esta funcion y descomentar lo comentado
	if body.has_method("talk") and Input.is_action_just_pressed("interact"):
		body.stop_talk()

#func _on_talk_entered(body:Node):
#	talk_area_array.append(body)

#func _on_talk_exited(body:Node):
#	if body in talk_area_array:
#		talk_area_array.erase(body)



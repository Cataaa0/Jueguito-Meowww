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
@onready var talk_area = $TalkArea


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
	


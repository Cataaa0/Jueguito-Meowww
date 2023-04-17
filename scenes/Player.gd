extends CharacterBody2D

const SPEED = 140.0
const JUMP_VELOCITY = -200.0
const GRAVITY = 600
const ACCELERATION = 1000

@onready var pivot = $Pivot
@onready var animatiojn_player = $AnimationPlayer
@onready var animation_tree = $AnimationTree
@onready var playback = animation_tree.get("parameters/playback")


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
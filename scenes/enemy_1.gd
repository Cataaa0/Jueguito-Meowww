extends CharacterBody2D
@onready var animation_player = $AnimationPlayer


# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):

	if velocity.x==0:
		animation_player.play("Idle")

	move_and_slide()


	

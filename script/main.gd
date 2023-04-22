extends Node2D
@onready var player = $Player
@onready var sup_izq = $Margen/sup_izq
@onready var inf_der = $Margen/inf_der
@onready var spawn_enemy = $Spawn_enemy
@onready var enemies = $Enemies
@export var n_enemies = 5
var enemy_scene = preload("res://scenes/enemy_1.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	player.set_camera_limit(sup_izq.position,inf_der.position)
	randomize_enemies()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func randomize_enemies():
	var spawns = []
	for i in n_enemies:
		var spawn = randi()%spawn_enemy.get_child_count()
		while spawn in spawns:
			spawn = randi()%spawn_enemy.get_child_count()
		spawns.append(spawn)
		var enemy : Enemy = enemy_scene.instantiate()
		enemy.position = spawn_enemy.get_child(spawn).position
		enemies.add_child(enemy)

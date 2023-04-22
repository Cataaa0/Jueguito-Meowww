extends CharacterBody2D
class_name Enemy
@export var enemy_cats: Array [Texture]
@export var idle_max: int = 3
@export var cat_names: Array [String]
@export var cat_professions: Array [String]

@onready var animation_player = $AnimationPlayer
@onready var sprite_2d = $Sprite2D

enum enum_inconsistencias {COLOR, NAME, PROFESSION}

var inconsistencia_cat := false
var n_inconsistencias := 0
var inconsistencias : Array[bool] = []  

var cat_color := 0 
var idle_n := 0

var n_cat_name = 0
var cat_name = '' :
	get: 
		return cat_names[n_cat_name]
var n_cat_profession = 0
var cat_profession = '' :
	get: 
		return cat_professions[n_cat_profession]

func _ready():
	randomize_color()
	randomize_idle()
	randomize_name()
	randomize_profession()
	
func randomize_name():
	cat_name =randi()%cat_names.size()
	
func randomize_profession():
	cat_profession =randi()%cat_professions.size()
	
func randomize_color():
	cat_color =randi()%enemy_cats.size()
	sprite_2d.texture=enemy_cats[cat_color]
		
func randomize_idle():
	idle_n = randi()%idle_max
	animation_player.play('idle'+str(idle_n))

func init_inconsistencias():
	inconsistencia_cat = true
	n_inconsistencias = randi_range(1,3)
	for i in n_inconsistencias:
		inconsistencias.append(true)
	for i in enum_inconsistencias.size()-n_inconsistencias:
		inconsistencias.append(false)
	inconsistencias.shuffle()

extends CharacterBody2D

@export var SPEED = 3000.0

var point = Vector2()
var direction = Vector2()

func bullet_init(pos : Vector2, dir : Vector2):
	position = pos
	direction = Vector2(dir.x - global_position.x, dir.y - global_position.y).normalized()

func _ready():
	velocity = direction * SPEED
	
func _physics_process(delta):
	move_and_slide()

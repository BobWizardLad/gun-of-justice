extends CharacterBody2D

enum READY_FIRE {ON, OFF}

@export var SPEED = 150.0
@export var ready_fire = READY_FIRE.ON

@onready var bullet = preload("res://scenes/bullet.tscn")

var direction = Vector2()
var flying_bullets = []

func toggle_ready_fire():
	if ready_fire == READY_FIRE.ON:
		ready_fire = READY_FIRE.OFF
		$GunCooldown.start()
	else:
		ready_fire = READY_FIRE.ON

# Make gun usable again after cooldown
func _on_gun_cooldown_timeout():
	toggle_ready_fire()

func _ready():
	pass
	
func _process(delta):
	if Input.is_action_pressed("shoot") and ready_fire == READY_FIRE.ON:
		flying_bullets.append(bullet.instantiate())
		flying_bullets[-1].bullet_init(position, get_global_mouse_position())
		get_parent().add_child(flying_bullets[-1])
		toggle_ready_fire()
	
func _physics_process(delta):
	# Get the direction vector of input
	direction = Vector2(
		Input.get_action_strength("right") - Input.get_action_strength("left"),
		Input.get_action_strength("down") - Input.get_action_strength("up")
	)
	if(direction.x < 0):
		$Sprite2D.flip_h = true
	if(direction.x > 0):
		$Sprite2D.flip_h = false
	
	# Apply speed scalar to dir vect and move and slide
	velocity = direction * SPEED
	move_and_slide()

# Player script, Handle movement

extends CharacterBody2D

const SPEED = 250
var moveDir

# Relevant nodes
@onready var BulletsHandler = get_node("/root/BulletsHandler")

# signals https://godotengine.org/qa/59131/how-do-send-a-variable-from-one-script-to-another-via-a-signal
signal shoot

# Player Motion
func move_input(delta):
	moveDir = Vector2.ZERO # Player move vector
	if(Input.is_action_pressed("move_up")):
		moveDir.y -= 1
	if(Input.is_action_pressed("move_down")):
		moveDir.y += 1
	if(Input.is_action_pressed("move_right")):
		moveDir.x += 1
	if(Input.is_action_pressed("move_left")):
		moveDir.x -= 1
	
	return moveDir

# Summon bullets
func call_bullet(pos, dir):
	if(Input.is_action_pressed("shoot")):
		shoot.emit(pos, dir)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	velocity = move_input(delta) * SPEED
	call_bullet(Vector2(2.0, 2.0),Vector2(2.0, 2.0))
	move_and_slide()
	

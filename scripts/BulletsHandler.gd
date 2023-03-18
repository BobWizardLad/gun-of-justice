extends Node2D

# Preload nodes
var trailCast = preload("res://bullet_trail.tscn").instantiate()

# Constants
const TRAIL_LENGTH = 50
const MAX_TRAILS = 40

# Node vars
var trail_list = []

# This function will recieve signals from shots fired and load the req
# bullet data into the RR queue updated in _process
# process hit detection
func _on_player_shoot(pos, dir):
	var bulletTrail = trailCast
	bulletTrail.position = pos
	bulletTrail.target_position = dir - pos

	if(bulletTrail.get_collider() != null and bulletTrail.get_collider().has_meta("Pawn")):
		# Send a damage signal to controller, pass on to queue
		# signal DMG
		#trail_list.append([bulletTrail, ])
	elif(bulletTrail.get_collider() != null and bulletTrail.get_collider().has_meta("Cover")):
		pass # Roll a hitchance, dmg if pass, then pass on to queue
	else:
		pass # send no dmg, just pass on to queue

func _update_trail_step():
	for trail in trail_list:
		

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass




extends Node2D

var trailCast = preload("res://bullet_trail.tscn").instantiate()

func _on_player_shoot(pos, dir):
	var bulletTrail = trailCast
	bulletTrail.position = pos
	bulletTrail.target_position = dir - pos
	print(bulletTrail.position)
	print(bulletTrail.target_position)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass




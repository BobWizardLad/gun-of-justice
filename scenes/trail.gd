extends Line2D

@export var length = 50
var point = Vector2()

# Remove initial point at game root
func _ready():
	remove_point(0)

func _process(delta):
	global_position = Vector2.ZERO
	global_rotation = 0
	
	point = get_parent().global_position
	
	add_point(point)
	while get_point_count() > length:
		remove_point(0)

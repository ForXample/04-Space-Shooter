extends KinematicBody2D

var vel = Vector2()
var rot_speed
var screen_size
var extents

func _ready():
	randomize()
	set_physics_process(true)
	vel = Vector2(rand_range(30, 100), 0).rotated(rand_range(0, 2 * PI))
	rot_speed = rand_range(-1.5, 1.5)
	screen_size = get_viewport_rect().size
	extents = get_node("sprite").get_texture().get_size()
	
func _physics_process(delta):
	set_rotation(get_rotation() + rot_speed * delta)
	move_and_collide(vel * delta)
	var pos = get_position()
	if pos.x > screen_size.x + extents.x:
		pos.x = -extents.x
	if pos.x < -extents.x:
		pos.x = screen_size.x + extents.x
	if pos.y > screen_size.y + extents.y:
		pos.y = -extents.y
	if pos.y < -extents.y:
		pos.y - screen_size.y + extents.y
	set_position(pos)
	


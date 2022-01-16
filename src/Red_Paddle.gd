extends KinematicBody2D

var speed = 350
var ball
var time
func _ready():
	ball = get_parent().find_node("ball")

func _physics_process(_delta):
	move_and_slide(Vector2(0, get_opponent_direction()) * speed)
	if position.x != 974:
		position.x = 974
	
func get_opponent_direction():
	if abs(ball.position.y - position.y) > 25:
		if ball.position.y > position.y: return 1
		else: return -1
	else: return 0
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


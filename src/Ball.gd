extends KinematicBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var speed = 200
const initspeed = 400.0
var velocity = Vector2.ZERO
var time = 0.0
var area
# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	velocity.x = [-1, 1][randi()% 2]
	velocity.y = [-0.5, 0.5][randi()% 2] # Replace with function body.
	
func _physics_process(delta):
	time = time + 0.16
	speed = exp(time/60)+initspeed
	var collision_object = move_and_collide(velocity * speed * delta)
	#print(speed)
	#print(time)
	if collision_object:
		velocity = velocity.bounce(collision_object.normal)
		
var playerScore = 0
var opponentScore = 0
# Called when the node enters the scene tree for the first time.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass





func _on_Game_Area_body_exited(ball):
	time = 0


	#$Red_Paddle.position = Vector2(974, 300)

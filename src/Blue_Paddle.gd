extends KinematicBody2D
var velocity = Vector2(0, 0)
var paddleSpeed = 400
func get_input(): # The player's movement vector.
	if Input.is_action_pressed("BlueDown") and position.y < get_viewport().size.y:
		velocity.y = paddleSpeed
	elif Input.is_action_pressed("BlueUp") and position.y > 0: 
		velocity.y = paddleSpeed * -1
	elif !Input.is_action_pressed("BlueUp") and !Input.is_action_pressed("BlueDown"):
		velocity.y *= 0
func _physics_process(delta):
	get_input()
	move_and_slide(velocity)
	if position.x != 50:
		position.x = 50

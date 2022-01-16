extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.

var playerScore = 0
var opponentScore = 0
func reset():
	if $ball.position.x <= 0:
		opponentScore = opponentScore + 1
		
		
	else:
		playerScore = playerScore + 1
	#print(playerScore)
	#print(opponentScore)
	$ball.position = Vector2(512, 300)
	$Blue_Paddle.position = Vector2(50, 300)
	$Red_Paddle.position = Vector2(974, 300)
	randomize()
	$ball.velocity.x = [-1, 1][randi()% 2]
	$ball.velocity.y = [-0.5, 0.5][randi()% 2]
func _process(_delta):
	if playerScore == 5:
		$BlueScore.text = str('Blue wins!')
		$RedScore.text = str('Blue Wins!')
		$ball.velocity = Vector2(0, 0)
		yield(get_tree().create_timer(2.0), "timeout")
		get_tree().quit()
	elif opponentScore == 5:
		$RedScore.text = str('Red Wins!')
		$BlueScore.text = str('Red Wins!')
		$ball.velocity = Vector2(0, 0)
		yield(get_tree().create_timer(2.0), "timeout")
		get_tree().quit()
	else:
		$BlueScore.text = str(playerScore)
		$RedScore.text = str(opponentScore)


func _on_Game_Area_body_exited(ball):
	reset()
	
	

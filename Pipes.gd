extends Node2D
@onready var floorref = $"../../MainFloor"
@onready var playerref = $"../../Birdman"
@onready var voidref = $"../../../voidout"
@onready var scoreref = $"../../Score"
var scored = false
var smacked = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x -= floorref.speed*delta
	
	if position.x == -250 or (playerref.dead == false and playerref.game_active == false):
		print("pipe destroyed")
		queue_free()

func _on_btm_body_entered(body):
	if body is Player and not smacked:
		playerref.kill_player()
		smacked = true


func _on_top_body_entered(body):
	if body is Player and not smacked:
		playerref.kill_player()
		smacked = true


func _on_point_body_entered(body):
	if body is Player and not scored and not playerref.dead:
		$Point/gotpoint.play()
		scoreref.points += 1
		scoreref.text = str(scoreref.points)

extends Camera2D
@onready var playerref = $"../reloadables/Birdman"
@onready var timerref = $shake
@onready var mainref = $".."
var timer_on = false
var shake_amt = -10

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if playerref.dead and not timer_on:
		timer_on = true
		position.y += shake_amt
		timerref.start()
		


func _on_shake_timeout():
	position.y -= shake_amt
	shake_amt *= -1
	timer_on = false
	if mainref.turned_black:
		timerref.stop()
		timer_on = false
	

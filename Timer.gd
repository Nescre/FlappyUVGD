extends Timer

@onready var playerref = $"../Birdman"
@onready var pipeset = load("res://pipes.tscn")
var pipeheight = RandomNumberGenerator.new()
var timer_on = false


func _physics_process(delta):
	if not timer_on:
		if playerref.dead or not playerref.game_active:
			timer_on = false
			stop()
		if not playerref.dead and playerref.game_active:
			timer_on = true
			start()

func _on_timeout():
	var pipeinst = pipeset.instantiate()
	pipeinst.position = Vector2(1200, 288 + pipeheight.randf_range(-100,100))
	add_child(pipeinst)
	timer_on = false

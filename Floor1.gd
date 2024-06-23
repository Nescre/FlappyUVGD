class_name Floor extends StaticBody2D

@onready var playerref: Player =  $"../Birdman"
@onready var fakeref = $"../FakeFloor"
var speed = 200
var stopped = false

# Called when the node enters the scene tree for the first time.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	floor_movement(delta)

func floor_movement(delta):
	if speed*delta != 0:
		position.x -= speed*delta
			
		if position.x < -1145:
			position.x = 1145
			
		if playerref.dead:
			speed -= 10
			if speed <= 0:
				speed = 0
				stopped = true

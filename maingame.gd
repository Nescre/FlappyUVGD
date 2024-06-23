extends Node2D
#INITIAL ASSETS
@onready var floorref: Floor = $reloadables/MainFloor
@onready var fakeref: Floor = $reloadables/FakeFloor
@onready var blackscreen = $voidout
@onready var cameraref = $Camera2D
@onready var playerref = $reloadables/Birdman

#PLAYER RELOADING
var reloadables = load("res://reloadables.tscn")
var queue = reloadables.instantiate()

#MISC
var turned_black = false
var reloaded = false

# Called when the node enters the scene tree for the first time.
func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)


# Called every frame. 'delta' is the elapsed time since the previous frame.
@warning_ignore("unused_parameter")
func _process(delta):
	if floorref.stopped:
		death_reload()

func death_reload():
	if not turned_black:
		blackscreen.modulate.a += 0.025
		if blackscreen.modulate.a >= 1:
			blackscreen.modulate.a = 1
			turned_black = true
			
	if turned_black:
		if not reloaded:
			position.y = 0
			floorref.speed = 200
			fakeref.speed = 200
			playerref.position = Vector2(550, 304)
			cameraref.position.y = 324
			playerref.rotation = 0
			playerref.dead = false
			reloaded = true
		blackscreen.modulate.a -= 0.025
		if blackscreen.modulate.a <= 0:
			blackscreen.modulate.a = 0
			floorref.stopped = false
			fakeref.stopped = true
			turned_black = false
			reloaded = false

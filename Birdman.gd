class_name Player extends CharacterBody2D

var game_active = false
var just_clicked = false
var dead = false
var idle_speed = 1
const JUMP_VELOCITY = -700.0
@onready var scoreref = $"../Score"
@onready var timerref = $"../Timer"
@onready var floorref = $"../MainFloor"
@onready var rotref = $Sprite2D

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")*2.5


func _physics_process(delta):
	
	if not game_active and not dead:
		position.y -= idle_speed
		if position.y > 324 or position.y < 284:
			idle_speed *= -1
			
		if Input.is_action_just_pressed("ui_accept") or just_clicked == true:
			scoreref.points = 0
			scoreref.text = str(scoreref.points)
			game_active = true
			velocity.y = JUMP_VELOCITY
	
	velocity.y += gravity * delta
	
	
	if dead:
		position.x -= floorref.speed*delta
	
	if not dead and game_active:

		# Handle Jump.
		if Input.is_action_just_pressed("ui_accept") or just_clicked == true:
			velocity.y = JUMP_VELOCITY
			$wingflap.play()
			just_clicked = false

		if position.y < -50:
			position.y = -50
		
		if is_on_floor():
			kill_player()
		
		rotation = deg_to_rad(velocity.y/15)
		move_and_slide()
	
func _input(event):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		just_clicked = true


func _on_top_body_entered(body):
	if body is Player:
		kill_player()


func _on_btm_body_entered(body):
	if body is Player:
		kill_player()


func kill_player():
	if not dead:
		dead = true
		game_active = false
		$deadnoise.play()

extends RichTextLabel
var maxpoints = 0
@onready var scoreref = $"../Score"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if scoreref.points > maxpoints:
		print("entered pts")
		maxpoints = scoreref.points
		text = str(maxpoints)

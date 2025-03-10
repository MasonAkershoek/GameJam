extends CanvasLayer

@onready var myLabel: Label = $Control/Label
@onready var mySprite: AnimatedSprite2D = $Control/AnimatedSprite2D

var active = false

var queue = []

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	visible = false
	mySprite.play("Jerumy")

func _process(delta: float) -> void:
	if queue.is_empty() and myLabel.text=="":
		active = false
		visible = false
	else:
		if not active and not queue.is_empty():
			active = true
			visible = true
			myLabel.text = queue.pop_front()
		
	if active and Input.is_action_just_pressed("Jump"):
		if not queue.is_empty():
			myLabel.text = queue.pop_front()
		else:
			myLabel.text=""
		
			
	
func addText(newText: String):
	queue.append(newText)

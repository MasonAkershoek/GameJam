extends CanvasLayer

@onready var myLabel: Label = $Control/Label

var active = false

var queue = []

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	visible = false

func _process(delta: float) -> void:
	if queue.is_empty():
		active = false
		visible = false
	else:
		if not active:
			active = true
			visible = true
			myLabel.text = queue.pop_front()
		
	if active and Input.is_action_just_pressed("Jump"):
		print("GG")
		if not queue.is_empty():
			myLabel.text = queue.pop_front()
		
			
	
func addText(newText: String):
	queue.append(newText)

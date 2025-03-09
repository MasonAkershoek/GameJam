extends CanvasLayer

@onready var myLabel: Label = $Control/Label

var active = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	visible = false

func _process(delta: float) -> void:
	if active and Input.is_action_just_pressed("Jump"):
		myLabel.text = ""
		visible = false
		active = false

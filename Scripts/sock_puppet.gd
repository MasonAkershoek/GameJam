extends Node2D

@onready var mySprite: AnimatedSprite2D = $AnimatedSprite2D

var HP = 3

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	mySprite.flip_h = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

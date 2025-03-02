extends RigidBody2D

@export var GRAVITY = 980

@onready var myGravity: Area2D = $Gravity

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	myGravity.gravity = GRAVITY


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

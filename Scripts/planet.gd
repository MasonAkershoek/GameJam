extends RigidBody2D

@export var GRAVITY = 980

@onready var myGravity: Area2D = $Gravity
@onready var myTexture: TextureRect = $TextureRect

var Radius = 0.0


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	myGravity.gravity = GRAVITY
	Radius = myTexture.texture.get_width()/2
	print(Radius)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	for body in myGravity.get_overlapping_bodies():
		if body is RigidBody2D:
			var direction = (global_position - body.global_position).normalized()
			body.apply_central_force(direction * GRAVITY * delta)

extends CharacterBody2D


@export var SPEED = 300.0
@export var JUMP_VELOCITY = -400.0
@export var PLANET = Node2D

var parent = Node2D

func _ready() -> void:
	parent = get_parent()

func _physics_process(delta: float) -> void:
	# Get direction towards the planet center
	var radial_dir = (PLANET.global_position - global_position).normalized()

	# Apply gravity to keep the player pressed against the planet
	velocity = radial_dir * 980 * delta

	# Get movement input
	var input = 1  # Arrow keys or custom inputs


	if input != 0:
		# Compute a smooth tangent direction
		var tangent = Vector2(-radial_dir.y, radial_dir.x) * input  
		
		# Use lerp to make the movement smoother
		velocity = velocity.lerp(tangent * SPEED, delta * 10)

	# Align the player's rotation to the planet's surface
	rotation = radial_dir.angle() - PI/2

	# Move the player smoothly
	move_and_slide()

func rotateWithPlanet():
	if parent.is_in_group("Planet"):
		pass

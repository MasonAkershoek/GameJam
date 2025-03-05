extends CharacterBody2D

enum {WALK, SHELL}
var random = RandomNumberGenerator.new()

@export var SPEED = 150
@export var RUNNING_INC = 0.0
@export var FLIP_CHANCE = 50
@export var viewRange = 10
@onready var mySprite: AnimatedSprite2D = $AnimatedSprite2D
@export var PLANET = Node2D
var direction = 0
var State = WALK

func _ready() -> void:
	random.randomize()

func _physics_process(delta: float) -> void:
	# Get direction towards the planet center
	var radial_dir = (PLANET.global_position - global_position).normalized()

	# Apply gravity to keep the player pressed against the planet
	velocity = radial_dir * 980 * delta

	if direction != 0:
		# Compute a smooth tangent direction
		var tangent = Vector2(-radial_dir.y, radial_dir.x) * direction  
		
		# Use lerp to make the movement smoother
		velocity = velocity.lerp(tangent * SPEED, delta * 10)

	# Align the player's rotation to the planet's surface
	rotation = radial_dir.angle() - PI/2
	
	move_and_slide()
	
func flip():
	direction *= -1
	if mySprite.flip_h:
		mySprite.flip_h = false
	else:
		mySprite.flip_h = true

func _process(delta: float) -> void:
	pass
 
func _on_timer_timeout() -> void:
	flip()

func _on_hit_box_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		State = SHELL

extends CharacterBody2D

enum {SPAWN, JUMPING, RUNNING, IDLE, DIE}

var State = SPAWN

@export var MAX_SPEED = 300.0
@export var ACCELERATION: float = 10.0
@export var JUMP_VELOCITY = -400.0
@export var HP = 3
@export var KNOCKBACK = 300
@export var USE_ACCELERATION = true

@onready var text: Label = $Label
@onready var mySprite: AnimatedSprite2D = $AnimatedSprite2D

var is_hit = false
var bounce = false
var direction = 0

func _ready() -> void:
	mySprite.play("Spawn")
	if not USE_ACCELERATION:
		ACCELERATION = MAX_SPEED

func _physics_process(delta: float) -> void:
	text.text = str(HP)
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	if bounce:
		velocity.y = -300
		bounce = false

	# Handle jump.
	if Input.is_action_just_pressed("Jump")  and is_on_floor() and not is_hit:
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var dir := Input.get_axis("MoveLeft", "MoveRight")
	if dir && not is_hit:
		print("Acceleration:" + str(ACCELERATION))
		print("Velocity: " + str(velocity.x))
		velocity.x = move_toward(velocity.x, dir*MAX_SPEED, ACCELERATION)
		direction = dir
	else:
		velocity.x = move_toward(velocity.x, 0, abs(direction)*ACCELERATION)
		
	if is_hit:
		is_hit = false
		velocity.x = (-direction) * KNOCKBACK

	move_and_slide()
	
func _process(delta: float) -> void:
	if State == DIE:
		queue_free()
	elif is_hit:
		pass
	elif abs(velocity.x) > 0:
		mySprite.play("Run")
	else:
		mySprite.play("Idle")
	
	if self.velocity.x > 0 and not is_hit:
		mySprite.flip_h = false
	elif self.velocity.x < 0 and not is_hit:
		mySprite.flip_h = true


func _on_hit_box_body_entered(body: Node2D) -> void:
	if body.is_in_group("Enemy") && not State == DIE:
		HP -= 1
		if HP < 1:
			State = DIE
		else:
			is_hit = true
		


func _on_bounce_box_body_entered(body: Node2D) -> void:
	if body.is_in_group("Enemy"):
		bounce = true

extends CharacterBody2D

enum {JUMPING, RUNNING, IDLE, DIE}

var State = IDLE

@export var MAX_SPEED = 200
@export var GUNKED_SPEED = 200.0
@export var ACCELERATION: float = 5
@export var JUMP_VELOCITY = -400.0
@export var HP = 3
@export var KNOCKBACK = 300
@export var USE_ACCELERATION = true

@onready var boxRect: Area2D = $PushBox
@onready var text: Label = $Label
@onready var mySprite: AnimatedSprite2D = $AnimatedSprite2D

var movment = 0

func _ready() -> void:
	mySprite.play("Idle")
	if not USE_ACCELERATION:
		ACCELERATION = MAX_SPEED

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
		
	# 

	# Handle jump.
	if Input.is_action_just_pressed("Jump")  and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var dir := Input.get_axis("MoveLeft", "MoveRight")
	if dir:
		velocity.x = move_toward(velocity.x, dir*MAX_SPEED, ACCELERATION)
	elif dir && velocity.x == 0:
		mySprite.play("Push")
	else:
		velocity.x = move_toward(velocity.x, 0, ACCELERATION)
		
	move_and_slide()
	
func _process(delta: float) -> void:
	text.text = str(HP)
	
	var dir := Input.get_axis("MoveLeft", "MoveRight")
	if dir != 0:
		mySprite.play("Run")
	else:
		mySprite.play("Idle")
		
	if dir > 0:
		mySprite.flip_h = false
		boxRect.position.x = 10
	elif dir < 0:
		mySprite.flip_h = true
		boxRect.position.x = -9


func _on_hit_box_body_entered(body: Node2D) -> void:
	if body.is_in_group("Enemy") && not State == DIE:
		HP -= 1
		if HP < 1:
			State = DIE
		


func _on_bounce_box_body_entered(body: Node2D) -> void:
	pass

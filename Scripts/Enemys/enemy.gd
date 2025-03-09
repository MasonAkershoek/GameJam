extends CharacterBody2D

enum {WALK, SHELL}
var random = RandomNumberGenerator.new()

@export var SPEED = 150
@export var RUNNING_INC = 0.0
@export var FLIP_CHANCE = 50
@export var viewRange = 10
@onready var mySprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var shellTimer: Timer = $"Shell Timer"

var direction = -1
var State = WALK

func _ready() -> void:
	random.randomize()
	mySprite.play("Idle")

func _physics_process(delta: float) -> void:

	if direction != 0 && State != SHELL:
		velocity.x = SPEED * direction
	else:
		velocity.x = 0
	
	move_and_slide()
	
func flip():
	direction *= -1
	if mySprite.flip_h:
		mySprite.flip_h = false
	else:
		mySprite.flip_h = true

func _process(delta: float) -> void:
	if velocity.x != 0 &&  State != SHELL:
		mySprite.play("Walk")
 
func _on_timer_timeout() -> void:
	if State != SHELL:
		flip()

func _on_hit_box_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		State = SHELL
		mySprite.play("In Shell")
		shellTimer.start()
		

func _on_shell_timer_timeout() -> void:
	State = WALK
	mySprite.play("Walk")

extends CharacterBody2D

enum States {SEARCH, AGRO}
var random = RandomNumberGenerator.new()

@export var SPEED = 150
@export var RUNNING_INC = 0.0
@export var FLIP_CHANCE = 50
@export var viewRange = 10
@onready var mySprite: AnimatedSprite2D = $AnimatedSprite2D
var direction = -1
var State = States.SEARCH
var target = null

func calcDistance():
	if target:
		return abs((transform.x - target.transform.x))

func _ready() -> void:
	random.randomize()

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
		
	velocity.x = direction * SPEED
	move_and_slide()

func flip():
	direction *= -1
	if mySprite.flip_h:
		mySprite.flip_h = false
	else:
		mySprite.flip_h = true

func _process(delta: float) -> void:
		
	# State Logic
	if State == States.AGRO:
		mySprite.play("Agro")
	elif velocity.x != 0:
		mySprite.play("Walk")
	else:
		mySprite.play("Idle")
	
	if State == States.SEARCH:
		Search()
		
func Search():
	if random.randi_range(0,100) == 50:
		if direction == 0:
			var x = [-1,1]
			direction = x[random.randi_range(0,1)]
		else:
			direction = 0
			

func Agro():
	pass

func _on_timer_timeout() -> void:
	flip()




func _on_hit_box_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		queue_free()

extends RigidBody2D

@export var pushSpeed = 50
@onready var myTimer: Timer = $Timer

var dir = 0

var pusher: Node2D = null

func _ready() -> void:
	lock_rotation = true

func _physics_process(delta: float) -> void:
	if myTimer.is_stopped() && dir != 0:
		apply_force(Vector2(pushSpeed*dir, 0))
	else:
		pass

func _on_timer_timeout() -> void:
	gravity_scale = 0

func _on_area_2d_area_entered(area: Area2D) -> void:
	myTimer.start()
	dir = 1
	print("left enter")


func _on_area_2d_area_exited(area: Area2D) -> void:
	myTimer.stop()
	dir = 0
	print("left exit")


func _on_right_area_entered(area: Area2D) -> void:
	myTimer.start()
	dir = -1
	print("right enter")
	gravity_scale = 1


func _on_right_area_exited(area: Area2D) -> void:
	myTimer.stop()
	dir=0
	print("right exit")

extends CharacterBody2D

@export var pushSpeed = 40
@onready var myTimer: Timer = $Timer

var dir = 0

var pusher: Node2D = null

func _physics_process(delta: float) -> void:
	if myTimer.is_stopped() && dir != 0:
		velocity.x = pushSpeed*dir
		print("GG")
	else:
		velocity.x = 0
	move_and_slide()

func _on_timer_timeout() -> void:
	pass

func _on_area_2d_area_entered(area: Area2D) -> void:
	myTimer.start()
	dir = 1


func _on_area_2d_area_exited(area: Area2D) -> void:
	myTimer.stop()
	dir = 0


func _on_right_area_entered(area: Area2D) -> void:
	myTimer.start()
	dir = -1


func _on_right_area_exited(area: Area2D) -> void:
	myTimer.stop()
	dir=0

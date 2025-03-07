extends RigidBody2D

@export var pushSpeed = 150
@onready var myTimer: Timer = $Timer

var dir = 0

func _physics_process(delta: float) -> void:
	pass

func _on_timer_timeout() -> void:
	pass # Replace with function body.


func _on_area_2d_body_entered(body: Node2D) -> void:
	myTimer.start()

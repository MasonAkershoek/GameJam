extends Node2D

@onready var Player: CharacterBody2D = $Player

func _ready() -> void:
	pass
	#SceneTransition.StartTransition("TravelMenu")


func _on_right_end_body_entered(body: Node2D) -> void:
	Player.position.x = 29


func _on_left_end_body_entered(body: Node2D) -> void:
	Player.position.x = 1120

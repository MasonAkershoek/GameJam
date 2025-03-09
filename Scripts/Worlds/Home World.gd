extends Node2D

@onready var Player: CharacterBody2D = $Player

func _ready() -> void:
	TextBox.addText("Welcome to Jerumys Home world!")
	TextBox.addText("Hop in the ship to the right of his house to begin his journy!")
	#SceneTransition.StartTransition("TravelMenu")
	pass


func _on_right_end_body_entered(body: Node2D) -> void:
	Player.position.x = 29


func _on_left_end_body_entered(body: Node2D) -> void:
	Player.position.x = 1120

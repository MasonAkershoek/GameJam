extends Node2D

@export var LeftSpawn = 0
@export var RightSpawn = 0

@onready var Player: CharacterBody2D = $Player

func _ready() -> void:
	TextBox.addText("Welcome to my home world!")
	TextBox.addText("I better hop in my ship.")
	Hud.start(Player)
	#SceneTransition.StartTransition("TravelMenu")
	pass


func _on_right_end_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		Player.position.x = LeftSpawn


func _on_left_end_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		Player.position.x = RightSpawn

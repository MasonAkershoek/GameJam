extends Node2D

var playerOverStart = false

@onready var transition: ColorRect = $"../SceneTransition"
@onready var player: CharacterBody2D = $Player
@onready var ship: AnimatedSprite2D = $Planet/Ship

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	if playerOverStart and Input.is_action_just_pressed("Action"):
		player.queue_free()
		ship.play("Pilot")
		transition.StartTransition("TravelMenu")

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		playerOverStart = true


func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.is_in_group("Player"):
		playerOverStart = false

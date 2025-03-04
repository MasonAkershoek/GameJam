extends Node2D

var playerOverStart = false

func _ready() -> void:
	$SceneTransition.StartTransition()

func _process(delta: float) -> void:
	if playerOverStart and Input.is_action_just_pressed("Action"):
		SceneManager.SwitchScene("TravelMenu")

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		playerOverStart = true


func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.is_in_group("Player"):
		playerOverStart = false

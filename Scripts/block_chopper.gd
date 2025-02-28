extends CharacterBody2D

var player = Node2D


func _physics_process(delta: float) -> void:
	pass
	

func grab(body: Node2D):
	pass

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		player = body

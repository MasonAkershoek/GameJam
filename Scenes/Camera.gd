extends Camera2D

@export var Player = Node2D


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.x = Player.position.x

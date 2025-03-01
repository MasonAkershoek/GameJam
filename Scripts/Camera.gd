extends Camera2D

@export var Player = Node2D

func _ready() -> void:
	zoom = Vector2(3,3)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Player != null:
		position.x = Player.position.x
		position.y = Player.position.y

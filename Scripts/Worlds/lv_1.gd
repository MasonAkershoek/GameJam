extends Node2D

@export var LeftSpawn = 0
@export var RightSpawn = 0

@onready var Player = $Player

func _ready() -> void:
	Hud.show()
	Hud.start(Player)
	TextBox.addText("Shoot looks like my shit crash landed!!")
	TextBox.addText("I better look around and try to find the missing parts")
	
func _process(delta: float) -> void:
	pass
	


func _on_right_end_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		Player.position.x = LeftSpawn


func _on_left_end_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		Player.position.x = RightSpawn

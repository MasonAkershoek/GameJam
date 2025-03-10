extends CanvasLayer

var Player = null

@onready var Hearts = [$Control/HBoxContainer/TextureRect, $Control/HBoxContainer/TextureRect2, $Control/HBoxContainer/TextureRect3]
@onready var mySprite: AnimatedSprite2D = $Control/AnimatedSprite2D

func _process(delta: float) -> void:
	if Player:
		if Player.HP == 2:
			Hearts[2].visible = false
		elif Player.HP == 1:
			Hearts[1].visible = false
		elif Player.HP == 0:
			Hearts[0].visible = false
		if Player.isGunky:
			mySprite.play("Gunky")
		else:
			mySprite.play("default")


func start(player: CharacterBody2D):
	show()
	Player = player
	for each in Hearts:
		each.visible = true

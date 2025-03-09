extends Node2D

@onready var myLabel: Label = $Label
@onready var myTimer: Timer = $Timer
@onready var mySprite: AnimatedSprite2D = $AnimatedSprite2D

var PlayerOver = false

var Broken = true

func _ready() -> void:
	if Global.CurrentWorld == Global.Worlds.HOMEWORLD:
		Broken = false
		mySprite.play("Default")
	else:
		mySprite.play("Broke")
	myLabel.visible = false

func _process(delta: float) -> void:
	if PlayerOver and Input.is_action_just_pressed("ui_up"):
		if Global.CollectedShipParts == 3:
			Global.CollectedShipParts = 0
			Broken = false
			mySprite.play("Default")
		if Global.CurrentWorld == Global.Worlds.HOMEWORLD:
			SceneTransition.StartTransition(Global.Worlds.WORLD1)
		else:
			if Broken:
				myTimer.start()
				myLabel.visible = true
			else:
				pass

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		PlayerOver = true


func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.is_in_group("Player"):
		PlayerOver = false


func _on_timer_timeout() -> void:
	myLabel.visible = false

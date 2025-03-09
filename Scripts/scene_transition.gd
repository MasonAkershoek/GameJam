extends CanvasLayer

@onready var myAnimation: AnimationPlayer = $ColorRect/AnimationPlayer
@onready var myColorRect: ColorRect = $ColorRect

var nextScene = ""

func _ready() -> void:
	visible = false

func _on_animation_player_animation_finished(anim_name:) -> void:
	visible = false
	myAnimation.stop()
	SceneManager.SwitchScene(nextScene)
	
func StartTransition(Scene):
	visible = true
	myAnimation.play("Fade")
	nextScene = Scene

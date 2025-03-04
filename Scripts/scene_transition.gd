extends ColorRect

@onready var myAnimation: AnimationPlayer = $AnimationPlayer

var nextScene = ""


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	myAnimation.stop()
	SceneManager.SwitchScene(nextScene)
	
func StartTransition(Scene: String):
	myAnimation.play("Fade")
	visible = true
	nextScene = Scene

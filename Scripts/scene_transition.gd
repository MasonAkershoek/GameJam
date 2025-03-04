extends ColorRect

@onready var myAnimation: AnimationPlayer = $AnimationPlayer




func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	print("GG")
	
func StartTransition():
	myAnimation.play("Fade")

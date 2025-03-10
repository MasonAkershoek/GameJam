extends Control

@onready var myAnimation: AnimationPlayer = $AnimationPlayer

var Animations: Dictionary = {
	Global.Worlds.WORLD1: "1To2",
	Global.Worlds.WORLD2: "2To3",
	Global.Worlds.WORLD3: "3To4" 
}

func _ready() -> void:
	Hud.hide()
	myAnimation.play(Animations[Global.CurrentWorld])


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	SceneTransition.StartTransition(Global.CurrentWorld)

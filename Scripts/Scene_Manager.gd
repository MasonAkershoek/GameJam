extends Node

@export var Scenes: Dictionary = {}

func _ready() -> void:
	pass

func AddScene(sceneAlias : String, scenePath : String) -> void:
	Scenes[sceneAlias] = scenePath
	
func RemoveScene(sceneAlias : String) -> void:
	Scenes.erase(sceneAlias)
	
func SwitchScene(sceneAlias : String) -> void:
	get_tree().change_scene_to_file(Scenes[sceneAlias])

func RestartScene() -> void:
	get_tree().reload_current_scene()
	
func QuitGame() -> void:
	get_tree().quit()

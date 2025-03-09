extends Node

var Scenes: Dictionary = {
	Global.Worlds.TRAVELMENU: "res://Scenes/UI/Travel Menu.tscn",
	Global.Worlds.HOMEWORLD: "res://Scenes/Levels/Home World.tscn",
	Global.Worlds.WORLD1: "res://Scenes/Levels/LV_1.tscn"
}

func _ready() -> void:
	pass

func AddScene(sceneAlias : String, scenePath : String) -> void:
	Scenes[sceneAlias] = scenePath
	
func RemoveScene(sceneAlias : String) -> void:
	Scenes.erase(sceneAlias)
	
func SwitchScene(sceneAlias) -> void:
	get_tree().change_scene_to_file(Scenes[sceneAlias])

func RestartScene() -> void:
	get_tree().reload_current_scene()
	
func QuitGame() -> void:
	get_tree().quit()

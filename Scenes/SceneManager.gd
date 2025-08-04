## Version: 1.0
##
## Manages the flow of scenes in the game, facilitating background loading and transitions.
## Must be used in place of [method SceneTree.change_scene_to_file] and [method SceneTree.change_scene_to_packed].
## This module must be added as an autoload.
##
## This script is part the [Quark Collection](https://github.com/Brasonite/Quark) under the MIT license.

class_name QuarkSceneManager extends Node

## The scene has just started loading.
signal started_loading(path: String)
## The scene has just finished being loaded.
signal finished_loading(path: String)

var current_scene_path := ""
var currently_loading := ""

func _init() -> void:
	process_mode = Node.PROCESS_MODE_ALWAYS

func _process(_delta: float) -> void:
	if currently_loading.is_empty():
		pass
	
	if ResourceLoader.load_threaded_get_status(currently_loading) == ResourceLoader.ThreadLoadStatus.THREAD_LOAD_LOADED:
		switch_to_loaded()

## Loads a scene in the background and switches to it once it's done.
## Signals are emitted to notify the current loading state.
func open(path: String) -> void:
	if not currently_loading.is_empty():
		printerr("Cannot load scene. Already loading '" + currently_loading + "'!")
		return
	
	var status := ResourceLoader.load_threaded_request(path, "PackedScene")
	if status != OK:
		printerr("Couldn't load scene '" + path + "' (error " + str(status) + ").")
		return
	
	currently_loading = path
	started_loading.emit(path)

func switch_to_loaded() -> void:
	var scene: PackedScene = ResourceLoader.load_threaded_get(currently_loading)
	get_tree().change_scene_to_packed(scene)
	finished_loading.emit(currently_loading)
	
	currently_loading = ""

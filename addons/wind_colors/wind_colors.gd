@tool
extends EditorPlugin


const WindColors_scene = preload("res://addons/wind_colors/wind_colors.tscn")

var WindColors_instance

func _enter_tree():
	WindColors_instance = WindColors_scene.instantiate()
	EditorInterface.get_editor_main_screen().add_child(WindColors_instance)
	_make_visible(false)
	

func _exit_tree():
	if WindColors_instance:
		WindColors_instance.queue_free()


func _has_main_screen():
	return true


func _make_visible(visible):
	if WindColors_instance:
		WindColors_instance.visible = visible


func _get_plugin_name():
	return "WindColors"


func _get_plugin_icon():
	return EditorInterface.get_editor_theme().get_icon("CanvasItemMaterial", "EditorIcons")

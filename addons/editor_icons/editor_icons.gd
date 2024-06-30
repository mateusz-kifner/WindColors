@tool
extends EditorPlugin

var editor_icons_scene = preload("res://addons/editor_icons/EditorIcons.tscn")

var EditorIconsInstance

func _enter_tree():
	EditorIconsInstance = editor_icons_scene.instantiate()
	add_child(EditorIconsInstance)
	
	add_tool_menu_item(_get_plugin_name(), EditorIconsInstance.popup_centered)
	for type in EditorInterface.get_editor_theme().get_icon_type_list():
		for name in EditorInterface.get_editor_theme().get_icon_list(type):
			var icon = EditorInterface.get_editor_theme().get_icon(name,type)
			var new_Hbox = HBoxContainer.new()
			EditorIconsInstance.get_child(0).get_child(0).add_child(new_Hbox)
			
			var new_Texture = TextureRect.new()
			new_Hbox.add_child(new_Texture)
			new_Texture.texture = icon
			#new_Texture.size = Vector2(128,128)
			#new_Texture.scale = Vector2(2,2)
			new_Texture.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT
			var new_label = Label.new()
			new_label.text = name
			new_Hbox.add_child(new_label)
			
			
func _exit_tree():
	EditorIconsInstance.queue_free()
	remove_tool_menu_item(_get_plugin_name())

func _get_plugin_name():
	return "EditorIcons"



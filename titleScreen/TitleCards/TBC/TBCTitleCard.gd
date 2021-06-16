extends Control

const nextScene = preload("res://titleScreen/TitleCards/Godot/GodotTitleCard.tscn")

	
func _on_VideoPlayer_finished():
	nextScene()
	
func nextScene():
		get_parent().add_child(nextScene.instance())
		queue_free()
 

func _input(event):
	if(event is InputEventJoypadButton):
		nextScene()


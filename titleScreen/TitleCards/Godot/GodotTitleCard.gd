extends Control

const mainMenuScene = preload("res://titleScreen/titleScreen.tscn")

	
func _on_VideoPlayer_finished():
	nextScene()
	
func nextScene():
		get_parent().add_child(mainMenuScene.instance())
		queue_free()


func _input(event):
	if(event is InputEventJoypadButton):
		nextScene()

extends Control

onready var pauseMenu = $"Pause menu"

func _process(delta):
	if Input.is_action_just_pressed("ui_select"):
		pauseMenu.visible = true
		get_tree().paused = true

extends Control


const optionsScene = preload("res://titleScreen/Options/Options.tscn")

#const titleScene = preload("res://titleScreen/titleScreen.tscn")

onready var selectorOne = $CenterContainer/VBoxContainer/HBoxContainer/Selector
onready var selectorThree = $CenterContainer/VBoxContainer/HBoxContainer2/Selector

onready var selectorOneB = $CenterContainer/VBoxContainer/HBoxContainer/Selector2
onready var selectorThreeB = $CenterContainer/VBoxContainer/HBoxContainer2/Selector2

onready var pauseMenu = $"."

var state = 0
var currentSelection = 0

func _ready():
	setCurrentSelection(0)

func _process(delta):
	if(pauseMenu.visible):
		if state == 0 :
			if Input.is_action_just_pressed("ui_down") and currentSelection < 1:
				currentSelection += 1
				setCurrentSelection(currentSelection)
			if Input.is_action_just_pressed("ui_up") and currentSelection > 0:
				currentSelection -= 1
				setCurrentSelection(currentSelection)
			if Input.is_action_just_pressed("ui_accept"):
				handleSelection(currentSelection)
#			if Input.is_action_just_pressed("ui_select"):
#				pauseMenu.visible = false
		if state == 1:
			if Input.is_action_just_pressed("ui_cancel"):
	#			options.visible = false
				state = 0
			
func handleSelection(_currentSelection):
	if _currentSelection == 0:
#		get_parent().add_child(startScene.instance())
#		queue_free()
		pauseMenu.visible = false
		get_tree().paused = false
	if _currentSelection == 1:
#		options.visible = true
		get_tree().quit()
#	if _currentSelection == 2:
##		get_parent().add_child(titleScene.instance())
##		queue_free()
#		pass


func setCurrentSelection(_currentSelection):
	selectorOne.text = ""
	selectorThree.text = ""
	
	selectorOneB.text = ""
	selectorThreeB.text = ""
	
	if _currentSelection == 0:
		selectorOne.text = ">"
		selectorOneB.text = "<"
	if _currentSelection == 1:
		selectorThree.text = ">"
		selectorThreeB.text = "<"

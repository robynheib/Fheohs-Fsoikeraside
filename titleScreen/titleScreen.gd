extends MarginContainer

const startScene = preload("res://demo2.tscn")
const optionsScene = preload("res://titleScreen/Options/Options.tscn")

onready var selectorOne = $CenterContainer/VBoxContainer/CenterContainer2/VBoxContainer/CenterContainer/HBoxContainer/Selector
onready var selectorTwo = $CenterContainer/VBoxContainer/CenterContainer2/VBoxContainer/CenterContainer2/HBoxContainer/Selector
onready var selectorThree = $CenterContainer/VBoxContainer/CenterContainer2/VBoxContainer/CenterContainer3/HBoxContainer/Selector

onready var selectorOneB = $CenterContainer/VBoxContainer/CenterContainer2/VBoxContainer/CenterContainer/HBoxContainer/Selector2
onready var selectorTwoB = $CenterContainer/VBoxContainer/CenterContainer2/VBoxContainer/CenterContainer2/HBoxContainer/Selector2
onready var selectorThreeB = $CenterContainer/VBoxContainer/CenterContainer2/VBoxContainer/CenterContainer3/HBoxContainer/Selector2

onready var options = $Options

var currentSelection = 0
var state = 0

func _ready():
	setCurrentSelection(0)

func _process(delta):
	if state == 0 :
		if Input.is_action_just_pressed("ui_down") and currentSelection < 2:
			currentSelection += 1
			setCurrentSelection(currentSelection)
		if Input.is_action_just_pressed("ui_up") and currentSelection > 0:
			currentSelection -= 1
			setCurrentSelection(currentSelection)
		if Input.is_action_just_pressed("ui_accept"):
			handleSelection(currentSelection)
	if state == 1:
		if Input.is_action_just_pressed("ui_cancel"):
			options.visible = false
			state = 0
		
		
func handleSelection(_currentSelection):
	if _currentSelection == 0:
		get_parent().add_child(startScene.instance())
		queue_free()
	if _currentSelection == 1:
		options.visible = true
		state = 1
	if _currentSelection == 2:
		get_tree().quit()
	

func setCurrentSelection(_currentSelection):
	selectorOne.text = ""
	selectorTwo.text = ""
	selectorThree.text = ""
	
	selectorOneB.text = ""
	selectorTwoB.text = ""
	selectorThreeB.text = ""
	
	if _currentSelection == 0:
		selectorOne.text = "\\"
		selectorOneB.text = "\\"
	if _currentSelection == 1:
		selectorTwo.text = "\\"
		selectorTwoB.text = "\\"
	if _currentSelection == 2:
		selectorThree.text = "\\"
		selectorThreeB.text = "\\"

extends Control

@onready var label = $Label
@onready var button = $Button
var dialogue = []
var current_index = 0

func show_text(new_dialogue):
	dialogue = new_dialogue
	current_index = 0
	label.text = dialogue[current_index]
	visible = true
	button.visible = true

func _on_Button_pressed():
	current_index += 1
	if current_index < dialogue.size():
		label.text = dialogue[current_index]
	else:
		visible = false
		button.visible = false

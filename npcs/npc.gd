extends Area2D

@export var dialogue_text : Array[String] = ["Hallo! Wie geht's dir?", "Schöner Tag heute, oder?", "Pass auf dich auf!"]
var in_interaction_range = false
var current_line = 0

@onready var dialogue_box = get_tree().get_first_node_in_group("dialogue_box") # Dein UI-Textfeld

func _ready():
	connect("body_entered", _on_body_entered)
	connect("body_exited", _on_body_exited)

func _on_body_entered(body):
	if body.is_in_group("player"):
		in_interaction_range = true

func _on_body_exited(body):
	if body.is_in_group("player"):
		in_interaction_range = false

func _input(event):
	if event.is_action_pressed("interact") and in_interaction_range:
		show_dialogue()

func show_dialogue():
	if dialogue_box != null:
		dialogue_box.show_text(dialogue_text)

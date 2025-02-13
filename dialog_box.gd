extends Control

@onready var label = $Panel/VBoxContainer/Label
@onready var close_button = $Panel/VBoxContainer/Button
@onready var camera = get_tree().get_first_node_in_group("player_camera")

# Liste mit möglichen Dialogen
var npc_texts = []

func _ready():
	visible = false  # Dialog ausblenden

func show_dialog(texts: Array):
	npc_texts = texts
	label.text = texts[randi() % texts.size()]  # Zufälligen Text auswählen
	visible = true  # Dialog sichtbar machen

func close_dialog():
	visible = false  # Dialog ausblenden

func _input(event):
	if event.is_action_pressed("close_interact"):
		close_dialog()

func _process(_delta):
	if camera:
		global_position = camera.global_position + Vector2(0, 100)  # 100 Pixel unter der Kamera

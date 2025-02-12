extends Area2D

var player_in_range = false
@onready var dialog_box = get_node("/root/World/DialogBox")  # Pfad zur DialogBox

# Unterschiedliche Texte für NPCs
var npc_dialogs = [
	"Hallo, Reisender!",
	"Schönes Wetter heute, oder?",
	"Ich hoffe, du hast genug Gold!",
	"Achte auf Monster in den Wäldern!"
]

func _ready():
	body_entered.connect(_on_body_entered)
	body_exited.connect(_on_body_exited)

func _on_body_entered(body):
	if body.name == "Player":
		player_in_range = true

func _on_body_exited(body):
	if body.name == "Player":
		player_in_range = false

func _input(event):
	if event.is_action_pressed("interact") and player_in_range:
		dialog_box.show_dialog(npc_dialogs)  # Dialog öffnen

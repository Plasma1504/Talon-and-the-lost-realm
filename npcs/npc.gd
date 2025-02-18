extends Area2D

var player_in_range = false
@onready var dialog_box = get_node("/root/World/DialogBox")  # Pfad zur DialogBox

# Unterschiedliche Texte für die Wachen bevor man alle Münzen hat
var default_dialogs = [
	"Hallo, Reisender! Hast du schon genug Geld gesammelt?",
	"Schönes Wetter heute, oder?",
	"Probier mal mit den Dorfbewohnern reden!",
]
#Text für die Wachen nachdem man alle Münzen hat
var completed_dialog = "Gratulation, du hast alle Münzen eingesammelt, jetzt sind wir uns sicher, dass du für den nächsten Bereich bereit bist."


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
		var player = get_tree().get_first_node_in_group("player")
		if player and player.all_coins_collected:
			dialog_box.show_dialog([completed_dialog])
		else:
			dialog_box.show_dialog(default_dialogs)

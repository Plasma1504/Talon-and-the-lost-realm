extends Area2D  # Das Hauptscript für die Münze

@export var coin_value: int = 1  # Wie viel die Münze wert ist
@onready var animated_sprite = $AnimatedSprite2D  # Referenz zur Animation

func _ready():
	animated_sprite.play("spin")  # Startet die Dreh-Animation automatisch

func _on_body_entered(body):
	if body.name == "Player":  # Prüft, ob der Spieler die Münze berührt
		body.add_coin(coin_value)  # Gibt dem Spieler die Münze (Spieler braucht `add_coin()`)
		queue_free()  # Entfernt die Münze aus dem Spiel

class_name State_Dodge extends State

@export_range(50, 500, 10) var dodge_speed : float = 160.0
@export_range(0.1, 2.0, 0.1) var dodge_duration : float = 0.5

var dodge_time : float = 0.0
var dodge_direction : Vector2 = Vector2.ZERO

@onready var idle : State_Idle = $"../Idle"
@onready var walk : State_Walk = $"../Walk"
@onready var animation_player: AnimationPlayer = $"../../AnimationPlayer"

## What happens when the player enters this state?
func Enter() -> void:
	dodge_time = dodge_duration
	dodge_direction = player.direction.normalized()
	
	if dodge_direction == Vector2.UP:
		animation_player.play("dodge_up")
	elif dodge_direction == Vector2.DOWN:
		animation_player.play("dodge_down")
	elif dodge_direction == Vector2.LEFT:
		animation_player.play("dodge_left")
	elif dodge_direction == Vector2.RIGHT:
		animation_player.play("dodge_right")
	else:
		# Für diagonale Bewegungen: Bestimme horizontalen Anteil
		if dodge_direction.x > 0:
			animation_player.play("dodge_right")
		elif dodge_direction.x < 0:
			animation_player.play("dodge_left")

	player.velocity = dodge_direction * dodge_speed

## What happens when the player exits this state?
func Exit() -> void:
	player.velocity = Vector2.ZERO

## What happens during the _process update in this state?
func Process(_delta: float) -> State:
	dodge_time -= _delta
	if dodge_time <= 0:
		if player.direction == Vector2.ZERO:
			return idle
		else:
			return walk
	return null

## What happens during the _physics_process update in this state?
func Physics(_delta: float) -> State:
	return null

## What happens with the input events in this state?
func HandleInput(_event: InputEvent) -> State:
	return null

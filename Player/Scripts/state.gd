class_name State extends Node

## Stores a reference to the player that this State belongs to
static var player : Player


func _ready():
	pass

## What happens when the player enteres this state?
func Enter() -> void:
	pass

## What happens when the Player exits this state?
func Exit() ->void:
	pass

## What happens during the _process update in this state?
func Process(_delta: float) -> State:
	return null

## What happens during the _physiscs_process update in this state?
func Physics(_delta: float) -> State:
	return null

## What happens with the input events in this state?
func HandleInput(_event: InputEvent) -> State:
	return null

class_name Player extends CharacterBody2D

var cardinal_direction : Vector2 = Vector2.DOWN
var direction : Vector2 = Vector2.ZERO
var coins = 0  # Anzahl der Münzen, die der Spieler hats = 0
var total_coins = 4  # Anzahl der Münzen, die eingesammelt werden müssen
var all_coins_collected = false  # Ob alle Münzen eingesammelt wurden


@onready var animation_player : AnimationPlayer = $AnimationPlayer
@onready var sprite : Sprite2D = $Sprite2D
@onready var state_machine : PlayerStateMachine = $StateMachine

func _ready():
	state_machine.Initialize(self)
	pass

func _process(delta):
	# Get input direction
	direction.x = Input.get_action_strength("right") - Input.get_action_strength("left")
	direction.y = Input.get_action_strength("down") - Input.get_action_strength("up")
	pass


# Diese Funktion wird aufgerufen, um eine Münze zu sammeln
func add_coin(value: int):
	coins += value
	print("Coins: ", coins) # Zeigt die Anzahl der Münzen an
	
	if coins >= total_coins:
		all_coins_collected = true
		print("Alle Münzen eingesammelt!") 


func _physics_process(delta):
	move_and_slide()



func SetDirection() -> bool:
	var new_dir : Vector2 = cardinal_direction
	if direction == Vector2.ZERO:
		return false
		
	if direction.x < 0:
		new_dir = Vector2.LEFT
	elif direction.x > 0:
		new_dir = Vector2.RIGHT
	elif direction.y < 0:
		new_dir = Vector2.UP
	elif direction.y > 0:
		new_dir = Vector2.DOWN
	
	if new_dir == cardinal_direction:
		return false
	
	cardinal_direction = new_dir
	return true



func UpdateAnimation( state : String) -> void:
	var anim_name = state + "_" + AnimDirection()
	print("Playing animation: " + anim_name)  # Debug print
	animation_player.play(anim_name)



func AnimDirection() -> String:
	if cardinal_direction == Vector2.DOWN:
		return "down"
	elif cardinal_direction == Vector2.UP:
		return "up"
	elif cardinal_direction == Vector2.RIGHT:
		return "right"
	else:
		return "left"

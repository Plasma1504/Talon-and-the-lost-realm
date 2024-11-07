extends CharacterBody2D

var cardinal_direction : Vector2 = Vector2.DOWN
var direction : Vector2 = Vector2.ZERO
var move_speed : float = 100.0
var state : String = "idle"

@onready var animation_player : AnimationPlayer = $AnimationPlayer
@onready var sprite : Sprite2D = $Sprite2D

func _ready():
	pass

func _process(delta):
	# Get input direction
	direction.x = Input.get_action_strength("right") - Input.get_action_strength("left")
	direction.y = Input.get_action_strength("down") - Input.get_action_strength("up")
	
	# Update velocity
	velocity = direction * move_speed
	
	# Update animation state and direction
	if SetState() or SetDirection():
		UpdateAnimation()
		# Debug print to see what's happening
		print("Direction: ", direction)
		print("Cardinal Direction: ", cardinal_direction)
		print("State: ", state)

func _physics_process(delta):
	move_and_slide()

func SetDirection() -> bool:
	var new_dir : Vector2 = cardinal_direction
	
	if direction == Vector2.ZERO:
		return false
	
	# Determine direction with priority to horizontal movement
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

func SetState() -> bool:
	var new_state : String = "idle" if direction == Vector2.ZERO else "run"
	if new_state == state:
		return false
	state = new_state
	return true

func UpdateAnimation() -> void:
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

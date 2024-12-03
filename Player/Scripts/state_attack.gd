class_name State_Attack extends State

var attacking : bool = false

@export_range(1,20,0.5) var decelerate_speed : float = 5.0

@onready var walk : State = $"../Walk"
@onready var animation_player: AnimationPlayer = $"../../AnimationPlayer"
@onready var idle: State_Idle = $"../Idle"
@onready var dodge: State_Dodge = $"../Dodge"



## What happens when the player enteres this state?
func Enter() -> void:
	player.UpdateAnimation("attack")
	animation_player.animation_finished.connect( EndAttack )
	attacking = true
	pass



## What happens when the Player exits this state?
func Exit() ->void:
	animation_player.animation_finished.disconnect( EndAttack )
	attacking = false
	pass



## What happens during the _process update in this state?
func Process(_delta: float) -> State:
	player.velocity -= player.velocity * decelerate_speed * _delta
	
	if attacking == false:
		if player.direction == Vector2.ZERO:
			return idle
		else:
			return walk
	return null



## What happens during the _physiscs_process update in this state?
func Physics(_delta: float) -> State:
	return null




## What happens with the input events in this state?
func HandleInput(_event: InputEvent) -> State:
	return null



func EndAttack( _newAnimationName : String ) -> void:
	attacking = false
	pass

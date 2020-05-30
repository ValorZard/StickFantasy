extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var input_vector:Vector2
var player_speed:float

#var dash_dead_zone:float # amount of time between movement inputs that count as a dash
#var time_since_last_movement_input:Timer # amount of time since last input
var dash_timer:Timer
var dash_multiplier:float # multipler of dash to player speed

enum MOVE_STATES{IDLE, WALK, DASH} #list of movement states player could be in
enum ATTACK_STATES{PEACEFUL, ATTACK, STRONG_ATK, SPECIAL_ATK, SHIELD} #list of attack states player could be in

var current_movement_state # What state of movement are you in
var current_attack_state # What attack are you in right now

### input booleans (for attack)
var has_pressed_light_attack:bool
var has_pressed_strong_attack:bool
var has_pressed_special_attack:bool
var has_pressed_shield:bool

#var has_pressed_shield:bool

#var is_new:bool #if player was just created

# Called when the node enters the scene tree for the first time.
func _ready():
	input_vector = Vector2(0,0)
	player_speed = 3
	
	current_movement_state = MOVE_STATES.IDLE
	current_attack_state = ATTACK_STATES.PEACEFUL
	
	#dash_dead_zone = 2 #second
	dash_timer = get_node("DashTimer")
	dash_timer.start()
	
	dash_multiplier = 2
	
	#is_new = true 
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	player_input(delta)
	state_handling(delta)
	player_movement(delta)
	pass

func player_input(delta):
	var horizontal_input: = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	var vertical_input: = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	
	input_vector = Vector2(horizontal_input, vertical_input).normalized()
	
	if(Input.get_action_strength("light_attack") != 0):
		has_pressed_light_attack = true
	else:
		has_pressed_light_attack = false
		
	if(Input.get_action_strength("strong_attack") != 0):
		has_pressed_strong_attack = true
	else:
		has_pressed_strong_attack = false
	
	if(Input.get_action_strength("special_attack") != 0):
		has_pressed_special_attack = true
	else:
		has_pressed_special_attack = false
		
	if(Input.get_action_strength("shield") != 0):
		has_pressed_shield = true
	else:
		has_pressed_shield = false
	
	pass


func state_handling(delta):
	#handls the state machine of the player.
	if(input_vector == Vector2.ZERO):
		current_movement_state = MOVE_STATES.IDLE
	else:
		### dash checker code, may split off into own function
		if(dash_timer.time_left != 0):
			current_movement_state = MOVE_STATES.DASH
		else:
			current_movement_state = MOVE_STATES.WALK
		
		#if(dash_timer.is_stopped()):
		#	dash_timer.start()
		#time_since_last_movement_input = 0
		pass
	
	if(has_pressed_light_attack):
		current_attack_state = ATTACK_STATES.ATTACK
	elif(has_pressed_strong_attack):
		current_attack_state = ATTACK_STATES.STRONG_ATK
	elif(has_pressed_special_attack):
		current_attack_state = ATTACK_STATES.SPECIAL_ATK
	elif(has_pressed_shield):
		current_attack_state = ATTACK_STATES.SHIELD
	else:
		current_attack_state = ATTACK_STATES.PEACEFUL
	
	pass

func player_movement(delta):
	if(current_movement_state == MOVE_STATES.DASH):
		move_and_collide(input_vector * player_speed * dash_multiplier)
	elif(current_movement_state == MOVE_STATES.WALK):
		move_and_collide(input_vector * player_speed)
	pass

func get_state():
	var state_string: = "Moving: "
	
	match(current_movement_state):
		MOVE_STATES.IDLE:
			state_string += "IDLE"
		MOVE_STATES.WALK:
			state_string += "WALK"
		MOVE_STATES.DASH:
			state_string += "DASH"
	
	state_string += "\nAttack: "
	
	match(current_attack_state):
		ATTACK_STATES.PEACEFUL:
			state_string += "PEACEFUL"
		ATTACK_STATES.ATTACK:
			state_string += "ATTACK"
		ATTACK_STATES.STRONG_ATK:
			state_string += "STRONG_ATTACK"
		ATTACK_STATES.SPECIAL_ATK:
			state_string += "SPECIAL_ATK"
		ATTACK_STATES.SHIELD:
			state_string += "SHIELD"
	
	#state_string += "\n TIME SINCE LAST MOVEMENT INPUT: " + str(time_since_last_movement_input)
	#state_string += "\n DASH DEAD ZONE: " + str(dash_dead_zone)
	state_string += "\n TIME LEFT TILL NO DASH: " + str(dash_timer.time_left)
	return state_string

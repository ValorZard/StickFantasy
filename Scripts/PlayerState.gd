extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

enum STATES { MOVE_LEFT, MOVE_RIGHT, MOVE_UP, MOVE_DOWN, 
	MOVE_UP_LEFT, MOVE_UP_RIGHT, MOVE_DOWN_LEFT, MOVE_DOWN_RIGHT,
	IDLE, WALK, DASH,
	LIGHT_ATTACK, DASH_ATTACK, MEDIUM_ATTACK, HEAVY_ATTACK, SPECIAL_ATTACK,
	SHIELD, PARRY, DODGEROLL,
	PEACEFUL,
	ATTACK_STUN, HITSTUN, MOVE_STUN, KNOCKBACK, WALLBOUNCE}
var current_state:Array = []
# Called when the node enters the scene tree for the first time.
	func _ready():
		for state in STATES:
			current_state.append(false)
		pass # Replace with function body.

# going to make getters and setters for all of the states because i dont have a better idea
# fml
	func set_move(set_value:bool):
		if(set_value):
			current_state[STATES.IDLE] = false  

			#should figure out a way to handle movement shit in its own function
			#dodgeroll
			if(current_state[STATES.SHIELD]):
				set_dodgeroll(set_value)
			#figure out how to work dash
		else:
			current_state[STATES.IDLE] = true  

	func set_move_left(set_value:bool):

		if(set_value):
			current_state[STATES.MOVE_LEFT] = true  
			current_state[STATES.MOVE_RIGHT] = false  
			current_state[STATES.MOVE_UP] = false  
			current_state[STATES.MOVE_DOWN] = false  
			current_state[STATES.MOVE_UP_LEFT] = false  
			current_state[STATES.MOVE_UP_RIGHT] = false  
			current_state[STATES.MOVE_DOWN_LEFT] = false  
			current_state[STATES.MOVE_DOWN_RIGHT] = false  

			set_move(set_value)
		else:
			current_state[STATES.MOVE_LEFT] = false  
		pass
	
	func set_move_right(set_value:bool):

		if(set_value):
			current_state[STATES.MOVE_LEFT] = false  
			current_state[STATES.MOVE_RIGHT] = true  
			current_state[STATES.MOVE_UP] = false  
			current_state[STATES.MOVE_DOWN] = false  
			current_state[STATES.MOVE_UP_LEFT] = false  
			current_state[STATES.MOVE_UP_RIGHT] = false  
			current_state[STATES.MOVE_DOWN_LEFT] = false  
			current_state[STATES.MOVE_DOWN_RIGHT] = false  

			set_move(set_value)
		else:
			current_state[STATES.MOVE_RIGHT] = false  
		pass

	func set_move_up(set_value:bool):

		if(set_value):
			current_state[STATES.MOVE_LEFT] = false  
			current_state[STATES.MOVE_RIGHT] = false  
			current_state[STATES.MOVE_UP] = true  
			current_state[STATES.MOVE_DOWN] = false  
			current_state[STATES.MOVE_UP_LEFT] = false  
			current_state[STATES.MOVE_UP_RIGHT] = false  
			current_state[STATES.MOVE_DOWN_LEFT] = false  
			current_state[STATES.MOVE_DOWN_RIGHT] = false  
	
			set_move(set_value)
		else:
			current_state[STATES.MOVE_UP] = false  
		pass

	func set_move_down(set_value:bool):

		if(set_value):
			current_state[STATES.MOVE_LEFT] = false  
			current_state[STATES.MOVE_RIGHT] = false  
			current_state[STATES.MOVE_UP] = false  
			current_state[STATES.MOVE_DOWN] = true  
			current_state[STATES.MOVE_UP_LEFT] = false  
			current_state[STATES.MOVE_UP_RIGHT] = false  
			current_state[STATES.MOVE_DOWN_LEFT] = false  
			current_state[STATES.MOVE_DOWN_RIGHT] = false  
		
			set_move(set_value)
		else:
			current_state[STATES.MOVE_DOWN] = false  
		pass

	func set_move_up_left(set_value:bool):

		if(set_value):
			current_state[STATES.MOVE_LEFT] = false  
			current_state[STATES.MOVE_RIGHT] = false  
			current_state[STATES.MOVE_UP] = false  
			current_state[STATES.MOVE_DOWN] = false  
			current_state[STATES.MOVE_UP_LEFT] = true  
			current_state[STATES.MOVE_UP_RIGHT] = false  
			current_state[STATES.MOVE_DOWN_LEFT] = false  
			current_state[STATES.MOVE_DOWN_RIGHT] = false  
			
			set_move(set_value)
		else:
			current_state[STATES._UP_LEFT] = false  
		pass

	func set_move_up_right(set_value:bool):

		if(set_value):
			current_state[STATES.MOVE_LEFT] = false  
			current_state[STATES.MOVE_RIGHT] = false  
			current_state[STATES.MOVE_UP] = false  
			current_state[STATES.MOVE_DOWN] = false  
			current_state[STATES.MOVE_UP_LEFT] = false  
			current_state[STATES.MOVE_UP_RIGHT] = true  
			current_state[STATES.MOVE_DOWN_LEFT] = false  
			current_state[STATES.MOVE_DOWN_RIGHT] = false  
				
			set_move(set_value)
		else:
			current_state[STATES._UP_RIGHT] = false  
		pass

	func set_move_up_right(set_value:bool):

		if(set_value):
			current_state[STATES.MOVE_LEFT] = false  
			current_state[STATES.MOVE_RIGHT] = false  
			current_state[STATES.MOVE_UP] = false  
			current_state[STATES.MOVE_DOWN] = false  
			current_state[STATES.MOVE_UP_LEFT] = false  
			current_state[STATES.MOVE_UP_RIGHT] = true  
			current_state[STATES.MOVE_DOWN_LEFT] = false  
			current_state[STATES.MOVE_DOWN_RIGHT] = false  
					
			set_move(set_value)
		else:
			current_state[STATES._UP_RIGHT] = false  
		pass

	func set_move_down_left(set_value:bool):

		if(set_value):
				current_state[STATES.MOVE_LEFT] = false  
				current_state[STATES.MOVE_RIGHT] = false  
				current_state[STATES.MOVE_UP] = false  
				current_state[STATES.MOVE_DOWN] = false  
				current_state[STATES.MOVE_UP_LEFT] = false  
				current_state[STATES.MOVE_UP_RIGHT] = false  
				current_state[STATES.MOVE_DOWN_LEFT] = true  
				current_state[STATES.MOVE_DOWN_RIGHT] = false  
						
				set_move(set_value)
		else:
			current_state[STATES._DOWN_LEFT] = false  
		pass

		func set_move_down_right(set_value:bool):

			if(set_value):
					current_state[STATES.MOVE_LEFT] = false  
					current_state[STATES.MOVE_RIGHT] = false  
					current_state[STATES.MOVE_UP] = false  
					current_state[STATES.MOVE_DOWN] = false  
					current_state[STATES.MOVE_UP_LEFT] = false  
					current_state[STATES.MOVE_UP_RIGHT] = false  
					current_state[STATES.MOVE_DOWN_LEFT] = false  
					current_state[STATES.MOVE_DOWN_RIGHT] = true 
							
					set_move(set_value)
			else:
				current_state[STATES._DOWN_RIGHT] = false  
			pass
	
	func set_dodgeroll(set_value:bool):
		if(set_value):
			pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

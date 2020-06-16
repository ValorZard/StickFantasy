extends VBoxContainer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var player:KinematicBody2D
var playerId

# Called when the node enters the scene tree for the first time.
func _ready():
	playerId = 0   #chooses which player to get data from based on if they are player 1 or 2 or whatever
	player = get_tree().get_nodes_in_group("Players")[playerId]
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var label = get_node("Label")
	label.text = "Current Player State: \n" + player.get_state()
	pass

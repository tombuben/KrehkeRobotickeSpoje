extends Node2D

@export var pos1 : Node2D
@export var pos2 : Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position = (pos1.get_kolo_position() + pos2.get_kolo_position()) / 2

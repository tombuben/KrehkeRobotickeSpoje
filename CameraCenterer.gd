extends Node2D

@export var pos1 : Node2D
@export var pos2 : Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	process_mode = Node.PROCESS_MODE_ALWAYS

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position = (pos1.get_kolo_position() + pos2.get_kolo_position()) / 2

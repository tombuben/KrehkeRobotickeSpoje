extends Node

var level : int = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func progress_level():
	level = level + 1
	get_tree().change_scene_to_file("res://level_" + str(level) + ".tscn")

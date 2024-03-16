extends Node2D

var listening_to_input : bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
	await get_tree().create_timer(1).timeout
	listening_to_input = true
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _input(event):
	if listening_to_input and !event is InputEventMouseMotion and !event is InputEventJoypadMotion:
		get_tree().change_scene_to_file("res://IntroVideo.tscn")

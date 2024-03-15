extends Node2D

@export var gameplayCamera: Camera2D
@onready var storyboardCamera : Camera2D = $StoryboardCamera

@export var storyboards: Array[Sprite2D]

var counter: int = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _input(event):
	if event.is_action_pressed("SwitchCamera"):
		switchCamera(counter)
		counter = counter+1
		

func switchCamera(storyboardIndex: int):
	if storyboards[storyboardIndex] != null:
		var storyboard = storyboards[storyboardIndex]
		storyboardCamera.global_position = storyboard.global_position
		storyboardCamera.make_current()
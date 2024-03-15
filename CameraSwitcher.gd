extends Node2D

@export var gameplayCamera: Camera2D
@onready var storyboardPlayer : storyboardPlayer = $StoryboardPlayer

var counter: int = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _input(event):
	if event.is_action_pressed("SwitchCamera"):
		await activateIntro()	
		
func activateIntro():
	await storyboardPlayer.playLevelIntro()
	activateGameplayCamera()
	
func activateOutro():
	await storyboardPlayer.playLevelOutro()
	activateGameplayCamera()

func activateGameplayCamera():
	gameplayCamera.make_current()

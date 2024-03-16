class_name CameraSwitcher extends Node2D

@export var gameplayCamera: Camera2D
@onready var storyboardPlayer : storyboardPlayer = $StoryboardPlayer

var counter: int = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	process_mode = Node.PROCESS_MODE_ALWAYS

func _input(event):
	if event.is_action_pressed("SwitchCamera"):
		await activateOutro()
		
func activateTitle():
	await storyboardPlayer.playLevelTitle()	
	activateGameplayCamera()
		
func activateIntro():
	await storyboardPlayer.playLevelIntro()
	activateGameplayCamera()
	
func activateOutro():
	await storyboardPlayer.playLevelOutro()
	activateGameplayCamera()

func activateGameplayCamera():
	gameplayCamera.make_current()

extends Node2D

@export var gameOverTextObject : Node2D
@export var nacobicSisatosti: float

@export var game_over_player : AudioStreamPlayer

@onready var cameraSwitcher : CameraSwitcher = $CameraSwitcher
@onready var sisoun : = $sisoun

var is_game_over = false

func _on_krabice_body_entered(body):
	if body is KillBody and is_game_over == false:
		is_game_over = true
		if game_over_player is AudioStreamPlayer:
			game_over_player.play()
		game_over()
		
		
func _ready():
	Global.level = Global.levels.find(get_tree().current_scene.scene_file_path)
	if not Global.LEVEL_CUTSCENE_FINISHED:	
		play_level_intro()
		
	Global.LEVEL_CUTSCENE_FINISHED = true

func _on_goal_target_body_entered(body):
	if body.name == "Krabice" and is_game_over == false:
		is_game_over = true
		progress_stage()
		
		
		
func play_level_intro():
	pause_game(true)
	await cameraSwitcher.activateTitle()
	await get_tree().create_timer(2).timeout
	await cameraSwitcher.activateIntro()
	await get_tree().create_timer(1).timeout
	pause_game(false)
	
func pause_game(pause : bool):
	get_tree().paused = pause
	
func play_level_outro():
	await get_tree().create_timer(2).timeout
	await cameraSwitcher.activateOutro()

func progress_stage():
	await play_level_outro()
	#todo move the camera to some slides with story, then, when no slides are available...
	Global.progress_level()

func game_over():
	await get_tree().create_timer(1).timeout
	await cameraSwitcher.activateGameOver()
	#replacated by storyboard cart
	#gameOverTextObject.visible = true
	await get_tree().create_timer(5).timeout
	Global.reset_level()

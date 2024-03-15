extends Node2D

var is_game_over = false
@export var gameOverTextObject : Node2D

func _on_krabice_body_entered(body):
	if body is KillBody and is_game_over == false:
		is_game_over = true
		game_over()

func _on_goal_target_body_entered(body):
	if body.name == "Krabice" and is_game_over == false:
		is_game_over = true
		progress_stage()

func progress_stage():
	#todo move the camera to some slides with story, then, when no slides are available...
	Global.progress_level()

func game_over():
	await get_tree().create_timer(1).timeout
	gameOverTextObject.visible = true
	await get_tree().create_timer(5).timeout
	Global.reset_level()

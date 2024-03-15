extends Node2D

func _on_krabice_body_entered(body):
	if body is KillBody:
		print("game over") 


func _on_goal_target_body_entered(body):
	if body.name == "Krabice":
		print("winner winner") 
		progress_stage()

func progress_stage():
	#todo move the camera to some slides with story, then, when no slides are available...
	Global.progress_level()

extends Node2D

func _on_krabice_body_entered(body):
	if body is KillBody:
		print("game over") 


func _on_goal_target_body_entered(body):
	if body.name == "Krabice":
		print("winner winner") 

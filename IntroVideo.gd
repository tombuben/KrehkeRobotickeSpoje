extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	Global.level = Global.levels.find(get_tree().current_scene.scene_file_path)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_video_stream_player_finished():
	Global.progress_level()

func _input(event):
	if event.is_action_pressed("SwitchCamera"):
		Global.progress_level()

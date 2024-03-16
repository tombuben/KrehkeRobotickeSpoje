extends Node

var level : int = 1

var MAX_LVL_COUNT = 3
var LEVEL_CUTSCENE_FINISHED : bool = false

@onready var levels = [
	"res://main_menu.tscn",
	"res://IntroVideo.tscn",
	"res://level_1.tscn",
	"res://level_1_end_video.tscn",
	"res://level_2.tscn",
	"res://level_2_end_video.tscn",
	"res://level_3.tscn",
	"res://level_3_end_video.tscn",
	"res://konec.tscn",
	]

# Called when the node enters the scene tree for the first time.
func _ready():
	process_mode = Node.PROCESS_MODE_ALWAYS

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _input(event):
	if event.is_action_pressed("ui_cancel"):
		get_tree().quit()
	
func progress_level():
	level = level + 1
	LEVEL_CUTSCENE_FINISHED = false
	if get_tree().change_scene_to_file(levels[level]) == ERR_CANT_OPEN:
		get_tree().change_scene_to_file("res://konec.tscn")
		
func reset_level():
	get_tree().reload_current_scene()

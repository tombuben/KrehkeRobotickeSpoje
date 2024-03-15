class_name storyboardPlayer extends Camera2D

@export var gameStart: Array[storyboard]
@export var gameEnd: Array[storyboard]

func playLevelIntro():
	for storyboard in gameStart:
		await activate(storyboard)	
	
func playLevelOutro():
	for storyboard in gameEnd:
		await activate(storyboard)


func activate(board: storyboard):
	if board != null:
		global_position = board.global_position
		make_current()
		await get_tree().create_timer(board.displayTime).timeout
		

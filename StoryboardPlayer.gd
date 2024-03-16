class_name storyboardPlayer extends Camera2D

@export var gameTitle: storyboard
@export var gameStart: Array[storyboard]
@export var gameEnd: Array[storyboard]
@export var gameOver: storyboard

func _ready():
	process_mode = Node.PROCESS_MODE_ALWAYS
	
func playLevelTitle():
	await activate(gameTitle)

func playLevelIntro():
	for storyboard in gameStart:
		await activate(storyboard)	
	
func playLevelOutro():
	for storyboard in gameEnd:
		await activate(storyboard)
		
func playLevelGameOver():
	position_smoothing_enabled = false
	await activate(gameOver)

func activate(board: storyboard):
	if board != null:
		global_position = board.global_position
		make_current()
		await get_tree().create_timer(board.displayTime).timeout
		

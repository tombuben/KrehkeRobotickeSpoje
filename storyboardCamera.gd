class_name storyboardCamera extends Camera2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func activate(board: storyboard):
		global_position = storyboard.global_position
		make_current()
		await get_tree().create_timer(3).timeout
		
class_name storyboard extends Sprite2D

@export var displayTime : float
@onready var audioPlayer : AudioStreamPlayer = $AudioStreamPlayer

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func playAudio():
	if audioPlayer is AudioStreamPlayer:
		audioPlayer.play()

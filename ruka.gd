class_name ruka extends Node2D

@export var torque_strength : float = 1000
@export var player : int = 0

@export var upper_limit : float = 2
@export var lower_limit : float = 0

@export var levost : bool

@onready var mover : Node2D = $rameno
@export var rotation_speed: float = 0.1

var is_controller = false

var up_action : String = ""
var down_action : String = ""

func init_ruka(set_player : int):
	if set_player == 1:
		up_action = "Player1Up"
		down_action = "Player1Down"
		is_controller = true
	elif set_player == 2:
		up_action = "Player2Up"
		down_action = "Player2Down"
		is_controller = true
		

	

# Called when the node enters the scene tree for the first time.
func _ready():
	if levost:
		rotation_speed = rotation_speed * -1
		var old_lower_limit = lower_limit
		lower_limit = -1*upper_limit
		upper_limit = -1*old_lower_limit
	#we call init_ruka in pandulak_script
	#init_ruka(player)
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if is_controller:
		if levost:
			print(mover.rotation)
		var input_strenght = Input.get_axis(down_action, up_action)
		mover.rotate(input_strenght * rotation_speed)
		if mover.rotation < lower_limit:
			mover.rotate(lower_limit - mover.rotation)
		if mover.rotation > upper_limit:
			mover.rotate(upper_limit - mover.rotation)
		

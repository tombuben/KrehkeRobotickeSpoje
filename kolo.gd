class_name kolo extends RigidBody2D

@export var torque_strength : float = 1000
@export var player : int = 0

var is_controller = false

var right_action : String = ""
var left_action : String = ""

func init_kolo(set_player : int):
	if set_player == 1:
		right_action = "Player1Right"
		left_action = "Player1Left"
		is_controller = true
	elif set_player == 2:
		right_action = "Player2Right"
		left_action = "Player2Left"
		is_controller = true

# Called when the node enters the scene tree for the first time.
func _ready():
	init_kolo(player)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if is_controller:
		var velocity = Input.get_axis(right_action, left_action)
		apply_torque_impulse(torque_strength * velocity)

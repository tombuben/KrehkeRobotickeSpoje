extends RigidBody2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if Input.is_action_pressed("Player1Right"):
		apply_torque_impulse(100.0)
	if Input.is_action_pressed("Player1Left"):
		apply_torque_impulse(-100.0)


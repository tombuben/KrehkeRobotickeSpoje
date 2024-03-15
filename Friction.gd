extends Node2D

@export var first : Node2D
@export var second : Node2D


var body : RigidBody2D

# Called when the node enters the scene tree for the first time.
func _ready():
	body = get_parent() as RigidBody2D


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _physics_process(delta):
	var avgVelocity = (first.get_velocity() + second.get_velocity())/2
	var diffVecloty = avgVelocity - body.linear_velocity
	var gravityVec = Vector2(0,40000)
	body.apply_force(diffVecloty*500 + gravityVec) 

extends Node2D

var bodies : Array[Node]

var body : RigidBody2D

# Called when the node enters the scene tree for the first time.
func _ready():
	body = get_parent() as RigidBody2D


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _physics_process(delta):
	if len(bodies) == 0:
		return
	
	var avgVelocitySum : Vector2 = Vector2(0,0)
	for collision in bodies:
		var body : RigidBody2D
		if collision is RigidBody2D:
			body = collision as RigidBody2D
		else:
			var parent = collision.get_parent()
			while (parent != null) and !(parent is RigidBody2D):
				parent = parent.get_parent()
				
			if !(parent is RigidBody2D):
				continue
			body = parent as RigidBody2D
			
		avgVelocitySum = avgVelocitySum + body.linear_velocity
		
	var avgVelocity : Vector2 = avgVelocitySum / len(bodies)
	var diffVecloty = avgVelocity - body.linear_velocity
	var gravityVec = Vector2(0,40000)
	body.apply_force(diffVecloty*500 + gravityVec) 


func _on_krabice_body_entered(body):
	if body not in bodies:
		bodies.append(body)

func _on_krabice_body_exited(body):
	if body in bodies:
		bodies.erase(body)

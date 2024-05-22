extends RigidBody


var speed = 5
var gravity = 9.8

func _physics_process(delta):
	var move_direction = Vector3.ZERO
	
	if Input.is_action_pressed("ui_up"):
		move_direction -= transform.basis.z
	if Input.is_action_pressed("ui_down"):
		move_direction += transform.basis.z
	if Input.is_action_pressed("ui_left"):
		move_direction -= transform.basis.x
	if Input.is_action_pressed("ui_right"):
		move_direction += transform.basis.x

	move_direction.y = 0
	move_direction = move_direction.normalized()

	var velocity = move_direction * speed
	velocity.y -= gravity * delta

	set_linear_velocity(velocity)

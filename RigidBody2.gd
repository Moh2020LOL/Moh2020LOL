extends RigidBody


func _physics_process(delta):
	var drag_coefficient = 0.1  # معامل اللزوجة
	var velocity = linear_velocity
	var drag_force = -velocity * drag_coefficient
	add_force(drag_force, Vector3())

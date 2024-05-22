extends KinematicBody

var mon = Vector3.ZERO
var speed = 200

func _physics_process(delta):
	translation += mon.normalized() * (delta * 60) * speed

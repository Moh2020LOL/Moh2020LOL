extends KinematicBody2D


var speed = 200
var gravity = 10
var jump = -200
var mon = Vector2.ZERO

func _physics_process(delta):
	speed *= delta
	move_and_slide(mon,Vector2.UP * delta)
	if Input.is_action_just_pressed("ui_up") && is_on_floor():
		mon.y = jump
	if is_on_floor() == false:
		mon.y += gravity
	if Input.is_action_pressed("ui_left"):
		mon.x = speed
	elif Input.is_action_pressed("ui_right"):
		mon.x = -speed
	else:
		mon.x = 0

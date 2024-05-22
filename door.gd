extends StaticBody


onready var player = $"../../player"

var open = true

func _physics_process(delta):
	if Input.is_action_just_pressed("shoot") and open and player.can_open:
		$AnimationPlayer.play("open")
		yield($AnimationPlayer,"animation_finished")
		open = false
	elif Input.is_action_just_pressed("shoot") and !open and player.can_open:
		$AnimationPlayer.play("close")
		yield($AnimationPlayer,"animation_finished")
		open = true

func _on_Area_body_entered(body):
	if body.is_in_group("player"):
		player.can_open = true


func _on_Area_body_exited(body):
	if body.is_in_group("player"):
		player.can_open = false

extends StaticBody
export(NodePath) var button_path
export(Array,NodePath) var bodies

export(float,1,100000) var stronge_magint:float
var bodys = []
var distence =Vector3.ZERO
var target = []
onready var button = get_node_or_null(button_path)
export(bool) var if_want_button = false
export(bool) var is_open = false
export(float,0,1000) var mass_kinematicbody:float =1 #prefer higer it
export(float,0,1000) var mass_Rigidbody:float =1 # prefer dont mise with him
func _ready():
	for child in bodies:
		bodys.append(get_node_or_null(child))
	if button != null:
		if if_want_button:
			button.connect("running",self,"_on_button_magent_run")
func _process(delta):
	if is_open:
			for child in bodys:
				if child is PhysicsBody:
					for child_target in target:
							if child_target == child:
								if child is RigidBody:
									distence = (translation - child.translation).normalized()
									child.add_force((stronge_magint/translation.distance_to(child.translation))*distence/mass_Rigidbody,distence)
									child.force_update_transform()
								else:
									distence = (translation - child.translation).normalized()
									child.translation += (stronge_magint/translation.distance_to(child.translation))*distence*delta/mass_kinematicbody

func _on_Area_body_entered(body):
	for child in bodys:
		if body == child:
			target.append(body)


func _on_Area_body_exited(body):
	for child in bodys:
		if body == child:
			target.erase(body)





func _on_button_magent_run(is_running):
	if is_running:
		is_open = true
	else:
		is_open = false

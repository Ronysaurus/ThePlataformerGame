extends KinematicBody

export var move_speed = 15.0
export var jump_force = 20.0
export var fall_speed = 75.0

var velocity = Vector3.ZERO

func _physics_process(delta):
	var direction = Vector3.ZERO
	
	direction.x =  Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
		
	if direction != Vector3.ZERO:
		direction = direction.normalized()
		if direction.x > 0:
			$Model.rotation_degrees.y = 90
		else:
			$Model.rotation_degrees.y = 270
	
	velocity.x = direction.x * move_speed;
	
	if is_on_floor() and Input.is_action_just_pressed("jump"):
		velocity.y += jump_force
	
	velocity.y -= fall_speed * delta
	velocity = move_and_slide(velocity, Vector3.UP)

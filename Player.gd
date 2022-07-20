extends KinematicBody

export var move_speed = 15.0
export var jump_force = 20.0
export var fall_speed = 75.0

var velocity = Vector3.ZERO

func _physics_process(delta):
	var direction = Vector3.ZERO
	
	if Input.is_action_pressed("move_right"):
		direction.x += 1
	if Input.is_action_pressed("move_left"):
		direction.x -= 1
		
	if direction != Vector3.ZERO:
		direction = direction.normalized()
		
	velocity.x = direction.x * move_speed;
	
	if is_on_floor() and Input.is_action_just_pressed("jump"):
		velocity.y += jump_force
	
	velocity.y -= fall_speed * delta
	velocity = move_and_slide(velocity, Vector3.UP)

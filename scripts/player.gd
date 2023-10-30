extends CharacterBody2D

const SPEED = 300.0

func _physics_process(delta):
	if Input.is_action_pressed("up"):
		velocity.y = -SPEED
	elif Input.is_action_pressed("down"):
		velocity.y = SPEED
	else:
		velocity.y = 0
		
	if Input.is_action_pressed("left"):
		velocity.x = -SPEED
	elif Input.is_action_pressed("right"):
		velocity.x = SPEED
	else:
		velocity.x = 0
		
	$Camera2D.offset = (get_global_mouse_position())/10
	
	move_and_slide()

extends CharacterBody2D

const SPEED = 300.0

@export var can_shot = true

func _physics_process(_delta):
	
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
		
	$Camera2D.offset = (get_global_mouse_position()-position)/10
	
	move_and_slide()
	
	if Input.is_action_just_pressed("click") and can_shot:
		var bullet = preload("res://scenes/bullet.tscn").instantiate()
		bullet.look_at(get_global_mouse_position()-position)
		bullet.rotation_degrees += 90
		bullet.position = position
		get_parent().add_child(bullet)

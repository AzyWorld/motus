extends Area2D

func _physics_process(_delta):
	position += Vector2(0, -50).rotated(rotation)


func _on_body_entered(body):
	if body.is_in_group("enemy"):
		body.queue_free()
		queue_free()

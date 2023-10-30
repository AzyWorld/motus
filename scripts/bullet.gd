extends Area2D

func _physics_process(_delta):
	position += Vector2(0, -50).rotated(rotation)

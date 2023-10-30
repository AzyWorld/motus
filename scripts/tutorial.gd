extends Node2D

func _process(delta):
	if len($Enemies.get_children()) == 0 and has_node("Door"):
		$Door.queue_free()

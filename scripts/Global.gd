extends Node


func startTutorial(obj):
	get_tree().change_scene_to_file("res://scenes/tutorial.tscn")

func SpawnEnemies(obj):
	obj.get_parent().get_node("Enemies").visible = true

func ExitTutorial(obj):
	get_tree().change_scene_to_file("res://scenes/lobby.tscn")

func FirstDungeon(obj):
	get_tree().change_scene_to_file("res://scenes/dungeon.tscn")

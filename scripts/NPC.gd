extends CharacterBody2D

@export_multiline var dialogue = ""
var current_word = -1

func _ready():
	dialogue = dialogue.split("~")

func _process(_delta):
	$Polygon2D.color = Color(1, 1, 1)*int(len($InteractingZone.get_overlapping_bodies())==1) + Color(0.2, 0.9, 0.2)*int(len($InteractingZone.get_overlapping_bodies())>1)
	for body in $InteractingZone.get_overlapping_bodies():
		if body.is_in_group("player") and Input.is_action_just_pressed("interact"):
			current_word += 1
			$Dialogue.visible = true
			$Dialogue/Label.text = dialogue[current_word].split("{")[0]
			if dialogue[current_word].split("{").size() > 1:
				Global.call(dialogue[current_word].split("{")[1])
		

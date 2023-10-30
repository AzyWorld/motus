extends CharacterBody2D

var behavior_preset = "Infighting"
var tween : Tween
var canAttack = true

@onready var player = get_tree().get_first_node_in_group("player")

func _physics_process(delta):
	if behavior_preset == "Infighting":
		for i in $Detector.get_overlapping_bodies():
			if i.is_in_group("player"):
				if (!tween or !tween.is_running()) and !(player in $DamageZone.get_overlapping_bodies()) and canAttack:
					canAttack = false
					$AttackTimer.start()
					if !tween or !tween.is_running():
						tween = create_tween()
						tween.tween_property(self, "position", player.position, 0.2).set_ease(Tween.EASE_IN)
					elif !tween.is_running(): tween.kill()
		if !tween or !tween.is_running():
			velocity = (player.position-position).normalized()*300
	move_and_slide()


func _on_detector_body_entered(body):
	pass


func _on_attack_timer_timeout():
	canAttack = true


func _on_damage_zone_body_entered(body):
	if body.is_in_group("player"):
		body.hp -= 10

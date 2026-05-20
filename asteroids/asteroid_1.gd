extends CharacterBody2D

var xspeed = 50
var yspeed = 0

func _physics_process(delta: float) -> void:
	velocity = Vector2(xspeed, yspeed) * delta * 100
	move_and_slide()

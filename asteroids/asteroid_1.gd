extends CharacterBody2D

var xspeed = 50
var yspeed = 0

var speed_rng = [-10, 0, 0, 10, -15, 15, -25, 25]

func _ready() -> void:
	yspeed = speed_rng.pick_random()

func _physics_process(delta: float) -> void:
	velocity = Vector2(xspeed, yspeed) * delta * 50
	move_and_slide()

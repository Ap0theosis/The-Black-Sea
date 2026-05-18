extends CharacterBody2D

signal speed_changed(type: String, num: Vector2)

var xspeed = 0
var yspeed = 0

var fuel = 5

func _physics_process(delta: float) -> void:
	move_and_slide()
	velocity = Vector2(xspeed, yspeed) * delta * 100
	if Input.is_action_just_pressed("ui_left"):
		if xspeed > -250:
			xspeed -= 50
			emit_signal("speed_changed", "x", xspeed)
	if Input.is_action_just_pressed("ui_right"):
		if xspeed < 250:
			xspeed += 50
			emit_signal("speed_changed", "x", xspeed)
	if Input.is_action_just_pressed("ui_up"):
		if yspeed > -250:
			yspeed -= 50
			emit_signal("speed_changed", "y", yspeed)
	if Input.is_action_just_pressed("ui_down"):
		if yspeed < 250:
			yspeed += 50
			emit_signal("speed_changed", "y", yspeed)
	if Input.is_action_just_pressed("ui_accept"):
		xspeed = 0
		yspeed = 0
		emit_signal("speed_changed", "y", yspeed)
		emit_signal("speed_changed", "x", xspeed)

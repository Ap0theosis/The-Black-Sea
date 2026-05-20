extends CharacterBody2D

@onready var sprite: Sprite2D = $Sprite2D

signal speed_changed(type: String, num: float, new_fuel: int)

var xspeed = 0
var yspeed = 0

var fuel = 5
var max_speed = 250

func _physics_process(delta: float) -> void:
	var raw_velocity = Vector2(xspeed, yspeed)
	
	if raw_velocity.length() > max_speed:
		raw_velocity = raw_velocity.limit_length(max_speed)
	
	velocity = raw_velocity * delta * 100
	move_and_slide()
	
	if Input.is_action_just_pressed("ui_left"):
		player_boost(Vector2(-1,0))
		sprite.frame = 3
	if Input.is_action_just_pressed("ui_right"):
		player_boost(Vector2(1,0))
		sprite.frame = 2
	if Input.is_action_just_pressed("ui_up"):
		player_boost(Vector2(0,-1))
		sprite.frame = 0
	if Input.is_action_just_pressed("ui_down"):
		player_boost(Vector2(0,1))
		sprite.frame = 1
	if Input.is_action_just_pressed("ui_accept"):
		xspeed = 0
		yspeed = 0
		emit_signal("speed_changed", "y", yspeed, fuel)
		emit_signal("speed_changed", "x", xspeed, fuel)

func player_boost(direction: Vector2) -> void:
	if fuel > 0:
		fuel -= 1
	else:
		return
	var directions = {
		Vector2(1,0): [1, "x"],
		Vector2(-1,0): [-1, "x"],
		Vector2(0,1): [1, "y"],
		Vector2(0,-1): [-1, "y"],
		}
	
	var impulse_multiplier = directions[direction][0]
	var axis_type = directions[direction][1]
	
	if axis_type == "x":
		if abs(xspeed + (50 * impulse_multiplier)) <= max_speed:
			xspeed += 50 * impulse_multiplier
			emit_signal("speed_changed", "x", xspeed, fuel)
	elif axis_type == "y":
		if abs(yspeed + (50 * impulse_multiplier)) <= max_speed:
			yspeed += 50 * impulse_multiplier
			emit_signal("speed_changed", "y", yspeed, fuel)

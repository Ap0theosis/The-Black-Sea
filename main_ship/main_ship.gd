extends CharacterBody2D
@onready var progress_bar: ProgressBar = $ProgressBar

var health = 100

var xspeed = 50
var yspeed = 0

func _ready() -> void:
	update_ui()

func _physics_process(delta: float) -> void:
	velocity = Vector2(xspeed, yspeed) * delta * 100
	move_and_slide()

func _on_area_2d_body_entered(body: Node2D) -> void:
	body.recharge_fuel()

func _on_hurtbox_body_entered(body: Node2D) -> void:
	body.xspeed += 75
	var rng = randi_range(-1, 1)
	body.yspeed = 50 * rng
	health -= 5
	update_ui()
	if health <= 0:
		get_tree().change_scene_to_file("res://game_over.tscn")

func update_ui() -> void:
	progress_bar.value = health

func _on_timer_timeout() -> void:
	xspeed += 5

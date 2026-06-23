extends Node2D

@onready var yspeed_label := $CanvasLayer/MarginContainer/VBoxContainer/HBoxContainer/RichTextLabel as RichTextLabel 
@onready var xspeed_label := $CanvasLayer/MarginContainer/VBoxContainer/HBoxContainer2/RichTextLabel as RichTextLabel 
@onready var fuel_label := $CanvasLayer/MarginContainer/VBoxContainer/HBoxContainer3/RichTextLabel as RichTextLabel 
@onready var coins_label := $CanvasLayer/MarginContainer/VBoxContainer/HBoxContainer4/RichTextLabel as RichTextLabel 
@onready var path_follow_2d: PathFollow2D = $Player/Path2D/PathFollow2D

@onready var labels = {
	"x": xspeed_label,
	"y": yspeed_label
}

var coins : int = 0

func _ready() -> void:
	yspeed_label.text = "0"
	xspeed_label.text = "50"
	fuel_label.text = "5"

func _on_player_speed_changed(type : String, num : int) -> void:
	var active_label = labels[type]
	
	active_label.text = str(abs(num))
	active_label.modulate = Color.MEDIUM_PURPLE if num < 0 else Color.SKY_BLUE

func _on_player_fuel_changed(new_fuel: int) -> void:
	fuel_label.text = str(new_fuel)

func _on_player_get_coin(num: int) -> void:
	coins += num
	if coins >= 200:
		get_tree().change_scene_to_file("res://win.tscn")
	coins_label.text = str(coins)

const ASTEROID = preload("res://asteroids/asteroid_1.tscn")

func _on_timer_timeout() -> void:
	var rng = randf()
	var new_asteroid = ASTEROID.instantiate()
	path_follow_2d.progress_ratio = rng
	new_asteroid.global_position = path_follow_2d.global_position
	get_tree().current_scene.add_child(new_asteroid)
	

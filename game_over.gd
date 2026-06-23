extends CanvasLayer

@onready var countdown: Label = $VBoxContainer/HBoxContainer/Label3

var time = 5

func _process(delta: float) -> void:
	countdown.text = str(time)

func _on_timer_timeout() -> void:
	time -= 1
	if time <= 0:
		get_tree().change_scene_to_file("res://main.tscn")

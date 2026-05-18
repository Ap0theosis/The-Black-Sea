extends Node2D

@onready var yspeed_label: RichTextLabel = $CanvasLayer/MarginContainer/VBoxContainer/HBoxContainer/RichTextLabel
@onready var xspeed_label: RichTextLabel = $CanvasLayer/MarginContainer/VBoxContainer/HBoxContainer2/RichTextLabel

func _on_player_speed_changed(type, num) -> void:
	var color = "red" if num < 0 else "blue"
	if num < 0:
		num *= -1
	match type:
		"x":
			xspeed_label.text = str(num)
			if color == "red":
				xspeed_label.modulate = Color.MEDIUM_PURPLE
			else:
				xspeed_label.modulate = Color.SKY_BLUE
		"y":
			yspeed_label.text = str(num)
			if color == "blue":
				yspeed_label.modulate = Color.MEDIUM_PURPLE
			else:
				yspeed_label.modulate = Color.SKY_BLUE
	

extends Node2D

@onready var yspeed_label := $CanvasLayer/MarginContainer/VBoxContainer/HBoxContainer/RichTextLabel as RichTextLabel 
@onready var xspeed_label := $CanvasLayer/MarginContainer/VBoxContainer/HBoxContainer2/RichTextLabel as RichTextLabel 
@onready var fuel_label := $CanvasLayer/MarginContainer/VBoxContainer/HBoxContainer3/RichTextLabel as RichTextLabel 

@onready var labels = {
	"x": xspeed_label,
	"y": yspeed_label
}

func _ready() -> void:
	yspeed_label.text = "0"
	xspeed_label.text = "0"
	fuel_label.text = "5"

func _on_player_speed_changed(type : String, num : int, new_fuel : int) -> void:
	fuel_label.text = str(new_fuel)
	if not labels.has(type): return
	
	var active_label = labels[type]
	
	active_label.text = str(abs(num))
	active_label.modulate = Color.MEDIUM_PURPLE if num < 0 else Color.SKY_BLUE

extends Control

@onready var description: RichTextLabel = $ColorRect/RichTextLabel

func _on_button_pressed():
	get_tree().change_scene_to_file("res://scenes/level/level.tscn")

func _on_quit_button_pressed():
	get_tree().quit()
	
func _ready():
	description.text += "\n\nSCORE : " + Store.get_score()

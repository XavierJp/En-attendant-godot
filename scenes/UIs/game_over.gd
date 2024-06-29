extends Control

func _on_button_pressed():
	get_tree().change_scene_to_file("res://scenes/level/level.tscn")

func _on_quit_button_pressed():
	get_tree().quit()
	
func _ready():
	$ColorRect/RichTextLabel.text += "Scoooore : " + OneHistory.get_score()

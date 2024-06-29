extends Control

func _ready():
	$TitleMusic.play()

func _on_start_button_pressed():
	$ButtonClickSound.play()
	get_tree().change_scene_to_file("res://scenes/level/level.tscn")

func _on_quit_button_pressed():
	$ButtonClickSound.play()
	get_tree().quit()


func _on_start_button_mouse_entered():
	$ButtonHoverSound.play()


func _on_quit_button_mouse_entered():
	$ButtonHoverSound.play()


extends Control

func continue_game():
	print("continue")
	# get_node(".").set_visible(false)
	get_tree().paused = false

func _input(ev):
	if ev is InputEventKey :
		if ev.keycode == KEY_ESCAPE:
			continue_game()

func _on_continue_button_pressed():
	continue_game()

func _on_quit_button_pressed():
	print('quit')
	get_tree().quit()


extends Node2D

func _input(ev):
	if ev is InputEventKey :
		if ev.keycode == KEY_ESCAPE:
			get_tree().paused = true
			get_node("Player/PauseScreen").set_visible(true)
	

func _process(delta):
	var level = abs(%Player.global_position.x) / 5000 + 1
	%Timer.wait_time = 3 / level

func spawn_mob():
	var new_mob = preload("res://scenes/enemies/enemy.tscn").instantiate()

	new_mob.global_position = %Player.global_position 
	new_mob.global_position.x = %Player.global_position.x + randi_range(500, 1500)
	new_mob.global_position.y =  randi_range(-1000, 1000)
	
	add_child(new_mob)


func _on_timer_timeout():
	print(%Timer.wait_time)
	print(%Player.global_position.x)
	spawn_mob()
	

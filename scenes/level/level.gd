extends Node2D

func _input(ev):
	if ev is InputEventKey :
		if ev.keycode == KEY_ESCAPE:
			get_tree().paused = true
			get_node("Player/PauseScreen").set_visible(true)
	


func _ready():
	print("The one and only history has ", OneHistory.Bible.size(), " chapiters.")
	for inputs in OneHistory.Bible :
		spawn_ghost(inputs)

func _process(delta):
	var level = abs(%Player.global_position.x) / 5000 + 1
	%SpawnMobTimer.wait_time = 3 / level

func spawn_enemy(new_enemy):
	new_enemy.global_position = %Player.global_position 
	new_enemy.global_position.x = %Player.global_position.x + randi_range(500, 1500)
	new_enemy.global_position.y =  randi_range(-1000, 1000)
	add_child(new_enemy)

func spawn_ghost(inputs: PackedVector2Array):
	var ghost: Ghost = preload("res://scenes/player/ghost.tscn").instantiate()
	ghost.set_inputs(inputs)
	add_child(ghost)

func _on_timer_timeout():
	print(%Timer.wait_time)
	print(%Player.global_position.x)
	var new_enemy = preload("res://scenes/enemies/small_ship.tscn").instantiate()
	spawn_enemy(new_enemy)

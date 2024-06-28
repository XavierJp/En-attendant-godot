extends Node2D



func _ready():
	print("The one and only history has ", OneHistory.Bible.size(), " chapiters.")
	for inputs in OneHistory.Bible :
		spawn_ghost(inputs)

func _process(delta):
	var level = abs(%Player.global_position.x) / 5000 + 1
	%Timer.wait_time = 3 / level

func spawn_mob():
	var new_mob = preload("res://scenes/enemies/enemy.tscn").instantiate()

	new_mob.global_position = %Player.global_position 
	new_mob.global_position.x = %Player.global_position.x + randi_range(500, 1500)
	new_mob.global_position.y =  randi_range(-1000, 1000)
	
	add_child(new_mob)

func spawn_ghost(inputs: PackedVector2Array):
	var ghost: Ghost = preload("res://scenes/player/ghost.tscn").instantiate()
	ghost.set_inputs(inputs)
	add_child(ghost)

func _on_timer_timeout():
	print(%Timer.wait_time)
	print(%Player.global_position.x)
	spawn_mob()

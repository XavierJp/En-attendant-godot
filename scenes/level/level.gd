extends Node2D

@onready var pause_menu = $Player/Camera2D/PauseMenu
var paused = false

func pause():
	if paused:
		pause_menu.hide()
		Engine.time_scale = 1
	else:
		pause_menu.show()
		Engine.time_scale = 0
	paused = !paused

func _ready():
	print("The one and only history has ", OneHistory.Bible.size(), " chapiters.")
	for inputs in OneHistory.Bible :
		spawn_ghost(inputs)

func _process(delta):
	# Check for pause
	if Input.is_action_just_pressed("pause"):
		pause()
	
	# Score
	var score = int(%Player.global_position.x / 1000)
	$Player/Score.text = str(score)

func spawn_enemy(new_enemy):
	new_enemy.global_position = %Player.global_position 
	new_enemy.global_position.x = %Player.global_position.x + randi_range(500, 1500)
	new_enemy.global_position.y =  randi_range(-1000, 1000)
	add_child(new_enemy)

func spawn_ghost(inputs: PackedVector2Array):
	var ghost: Ghost = preload("res://scenes/player/ghost.tscn").instantiate()
	ghost.set_inputs(inputs)
	add_child(ghost)

func _on_spawn_small_ship_timer_timeout():
	var new_enemy = preload("res://scenes/enemies/small_ship.tscn").instantiate()
	spawn_enemy(new_enemy)
	var level = abs(%Player.global_position.x) / 5000 + 1
	$SpawnSmallShipTimer.wait_time = 3 / level

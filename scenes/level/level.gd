extends Node2D

@onready var player = $Camera2D/HumanPlayer

@onready var pause_menu = $Camera2D/PauseMenu

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
	player.global_position.y = randi_range(-1000, 1000)
	Store.start_new_run()
	for inputs in Store.All_runs :
		spawn_ghost(inputs)

func _process(delta):
	# Check for pause
	if Input.is_action_just_pressed("pause"):
		pause()
	
	# Score
	$Camera2D/VBoxContainer/ScoreLabel.text = Store.get_score()
	$Camera2D/VBoxContainer2/NitroBar.value = Store.nitro_boost
	
func spawn_enemy(new_enemy):
	new_enemy.global_position = %HumanPlayer.global_position 
	new_enemy.global_position.x = %HumanPlayer.global_position.x + randi_range(500, 1500)
	new_enemy.global_position.y =  randi_range(-1000, 1000)
	add_child(new_enemy)

const ghost_asset = preload("res://scenes/player/ghost_player.tscn")
func spawn_ghost(inputs: PackedVector2Array):
	var ghost: Ghost = preload("res://scenes/player/ghost_player.tscn").instantiate()
	ghost.set_inputs(inputs)
	get_node("Camera2D").add_child(ghost)
	
const small_ship_asset = preload("res://scenes/enemies/small_ship.tscn")
const big_ship_asset = preload("res://scenes/enemies/big_ship.tscn")

func _on_spawn_small_ship_timer_timeout():
	var new_enemy
	var level = abs(%HumanPlayer.global_position.x) / 5000 + 1
	var should_spaw_bigger_ship =  %HumanPlayer.global_position.x > 100 and randi() % 20 == 0
	if (should_spaw_bigger_ship) :
		new_enemy = big_ship_asset.instantiate()
	else:
		new_enemy = small_ship_asset.instantiate()
	
	spawn_enemy(new_enemy)
	$SpawnSmallShipTimer.wait_time = 3 / level

extends Node2D

@onready var player = $Camera2D/HumanPlayer

@onready var pause_menu = $Camera2D/PauseMenu

var paused = false
var initial_ship_timer = 1

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
		
	$SpawnSmallShipTimer.wait_time = initial_ship_timer

func _process(delta):
	# Check for pause
	if Input.is_action_just_pressed("pause"):
		pause()
		
	if paused and Input.is_action_just_pressed("quit"):
		get_tree().quit()
	
	# Score
	$Camera2D/VBoxContainer/ScoreLabel.text = Store.get_score()
	$Camera2D/VBoxContainer2/NitroBar.value = Store.nitro_boost
	
	# increase enemy spawn
	$SpawnSmallShipTimer.wait_time = initial_ship_timer / (Store.position_score + 1) 
	
func spawn_enemy(new_enemy):
	new_enemy.global_position.x = %HumanPlayer.global_position.x + randi_range(0, 10)
	new_enemy.global_position.y = %HumanPlayer.global_position.y + randi_range(-1000, 1000)
	%HumanPlayer.add_sibling(new_enemy)

const ghost_asset = preload("res://scenes/player/ghost_player.tscn")

func spawn_ghost(inputs: PackedVector2Array):
	var ghost: Ghost = preload("res://scenes/player/ghost_player.tscn").instantiate()
	ghost.set_inputs(inputs)
	%HumanPlayer.add_sibling(ghost)
	
const small_ship_asset = preload("res://scenes/enemies/small_ship.tscn")
const big_ship_asset = preload("res://scenes/enemies/big_ship.tscn")

func _on_spawn_small_ship_timer_timeout():
	var new_enemy
	var should_spaw_bigger_ship =  %HumanPlayer.global_position.x > 100 and randi() % 20 == 0
	if (should_spaw_bigger_ship) :
		new_enemy = big_ship_asset.instantiate()
	else:
		new_enemy = small_ship_asset.instantiate()

	spawn_enemy(new_enemy)

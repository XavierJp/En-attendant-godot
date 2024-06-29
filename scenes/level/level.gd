extends Node2D

@onready var player: HumanPlayer = $Camera2D/HumanPlayer
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
	
	# Score
	$Camera2D/VBoxContainer/ScoreLabel.text = Store.get_score()
	$Camera2D/VBoxContainer2/NitroBar.value = Store.nitro_boost
	
	# increase enemy spawn
	$SpawnSmallShipTimer.wait_time = initial_ship_timer / (Store.position_score + 1) 
	
func spawn_enemy(new_enemy):
	new_enemy.position.x = 2000*randi_range(1, 1.2)
	new_enemy.position.y = randi_range(-1000, 1000)
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

	spawn_asteroid()
	
	spawn_enemy(new_enemy)

const asteroid_asset = preload("res://scenes/enemies/asteroid.tscn")
func spawn_asteroid() -> void:
	var asteroid = asteroid_asset.instantiate()
	%HumanPlayer.add_sibling(asteroid)

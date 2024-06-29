extends Node2D

@onready var score_label: Label = $Camera2D/VBoxContainer/ScoreLabel
@onready var player: HumanPlayer = $Camera2D/HumanPlayer
@onready var ost_music: AudioStreamPlayer = $OSTMusic
@onready var pause_menu = $Camera2D/PauseMenu
@onready var ghost_gauge_bar = $Camera2D/GhostGauge/GhostGaugeBar

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
	#player.inventory.weapons = Store.weapons
	for weapon in player.inventory.create_weapons():
		player.add_child(weapon)
	Store.start_new_run()
	ost_music.play()
	

func _process(delta):
	# Check for pause
	if Input.is_action_just_pressed("pause"):
		pause()
	
	ghost_gauge_bar.value = Store.ghost_gauge
	score_label.text = "Score : "+Store.get_score()


func _on_timer_timeout():
	for weapon in player.inventory.weapons:
		weapon.upgrade()

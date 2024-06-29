extends Node2D

@onready var player: HumanPlayer = $Camera2D/HumanPlayer
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

func _process(delta):
	# Check for pause
	if Input.is_action_just_pressed("pause"):
		pause()
	
	# Score
	$Camera2D/VBoxContainer/ScoreLabel.text = "Score : "+Store.get_score()
	$Camera2D/GhostGauge/GhostGaugeBar.value = Store.ghost_gauge

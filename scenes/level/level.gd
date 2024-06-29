extends Node2D

@onready var nitro_bar: ProgressBar = $Camera2D/VBoxContainer2/NitroBar
@onready var score_label: Label = $Camera2D/VBoxContainer/ScoreLabel
@onready var player: HumanPlayer = $Camera2D/HumanPlayer
@onready var ost_music: AudioStreamPlayer = $OSTMusic
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
	ost_music.play()
	

func _process(delta):
	# Check for pause
	if Input.is_action_just_pressed("pause"):
		pause()
	
	# Score
	score_label.text = Store.get_score()
	nitro_bar.value = Store.nitro_boost

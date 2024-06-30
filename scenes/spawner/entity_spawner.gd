class_name EntitySpawner extends Node2D

@onready var timer: Timer = $Timer

var initial_timer = 1

func _ready():
	timer.wait_time = initial_timer

func update_timer():
	pass

func _process(_delta):
	update_timer()

func _on_timer_timeout():
	pass


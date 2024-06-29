extends Node2D
class_name EntitySpawner

var initial_timer = 1

func _ready():
	$Timer.wait_time = initial_timer

func update_timer():
	pass

func _process(_delta):
	update_timer()

func _on_timer_timeout():
	pass


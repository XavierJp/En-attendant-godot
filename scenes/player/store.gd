extends Node

var All_runs = []
var current_run = PackedVector2Array([])
var page = 0
var kill_score = 0
var position_score = 0
var nitro_boost = 0
	
	
func start_new_run():
	kill_score = 0
	position_score = 0
	nitro_boost = 0
	
func get_score():
	return str(int(kill_score + position_score))
	
func end_run():
	page += 1;
	All_runs.append(current_run);
	current_run = PackedVector2Array([])

func record_direction(direction: Vector2):
	current_run.append(direction)

func add_nitro_boost(boost):
	nitro_boost = min(nitro_boost+boost, 1000)

extends Node

const max_ghost_gauge = 1000
var ghost_gauge = 0
var ghost_spawned_counter = 0

var All_runs = []
var current_run = PackedVector2Array([])
var page = 0
var kill_score = 0
var position_score = 0

func start_new_run():
	kill_score = 0
	position_score = 0
	ghost_gauge = 0
	ghost_spawned_counter = 0
	
func get_score():
	return str(int(kill_score + position_score))
	
func has_ghost():
	return All_runs.size()>0
	
func end_run():
	page += 1;
	All_runs.append(current_run);
	current_run = PackedVector2Array([])

func record_direction(direction: Vector2):
	current_run.append(direction)

func increase_ghost_gauge(boost):
	var ghost_factor = 2**ghost_spawned_counter
	
	if(ghost_gauge<max_ghost_gauge):
		ghost_gauge = min(ghost_gauge + (boost / ghost_factor), max_ghost_gauge)

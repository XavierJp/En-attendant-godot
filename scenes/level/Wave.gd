class_name Wave extends Node2D

@onready var some_asteroid_spawner: AsteroidSpawner = $SomeAsteroidSpawner
@onready var some_big_asteroid_spawner: AsteroidSpawner = $SomeBigAsteroidSpawner

signal ended()

var wave = [
	[0, func some_asteroid(): some_asteroid_spawner.timer.start()],
	[5, func some_big_asteroid(): some_big_asteroid_spawner.timer.start()],
	[10, func no_more_asteroid(): 
	some_asteroid_spawner.timer.stop();
	some_big_asteroid_spawner.timer.stop()
	],
	
	[20, func some_asteroid(): some_asteroid_spawner.timer.start()],
	[25, func some_big_asteroid(): some_big_asteroid_spawner.timer.start()],
	[35, func no_more_asteroid(): 
	some_asteroid_spawner.timer.stop();
	some_big_asteroid_spawner.timer.stop()
	],
	
	#
	
	[50, func end_on_wave(): 
	some_asteroid_spawner.timer.stop()
	some_big_asteroid_spawner.timer.stop()
	ended.emit()]
]

func _ready():
	some_asteroid_spawner.timer.stop()
	some_big_asteroid_spawner.timer.stop()

func _process(delta):
	var queued_wave = wave.front();
	if (!queued_wave):
		return
		
	var wave_start = queued_wave[0]
	if (Store.position_score <= wave_start):
		return

	var wave= wave.pop_front()
	var wave_action = queued_wave[1]
	
	print("> Wave " , wave_start , " : " , wave_action)
	wave_action.call()

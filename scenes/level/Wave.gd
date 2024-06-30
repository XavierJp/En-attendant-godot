class_name Wave extends Node2D

@onready var some_asteroid_spawner: AsteroidSpawner = $SomeAsteroidSpawner
@onready var some_big_asteroid_spawner: AsteroidSpawner = $SomeBigAsteroidSpawner
@onready var ship_spawner: ShipSpawner = $ShipSpawner

signal ended()

var wave = [
	[0, func some_asteroid(): some_asteroid_spawner.timer.start()],
	[2, func some_ship(): ship_spawner.timer.start()],
	[3, func no_ship(): ship_spawner.timer.stop()],
	[5, func some_big_asteroid(): some_big_asteroid_spawner.timer.start()],
	[10, func no_more_asteroid(): 
	some_asteroid_spawner.timer.stop();
	some_big_asteroid_spawner.timer.stop()
	],
	
	[12, func some_ship(): ship_spawner.timer.start()],
	[18, func no_ship(): ship_spawner.timer.stop()],
	
	[20, func some_asteroid(): some_asteroid_spawner.timer.start()],
	[25, func some_big_asteroid(): some_big_asteroid_spawner.timer.start()],
	[30, func no_small_asteroid(): some_asteroid_spawner.timer.stop()],
	[35, func no_more_asteroid(): 
	some_asteroid_spawner.timer.stop();
	some_big_asteroid_spawner.timer.stop()
	],
	
	[37, func some_ship(): ship_spawner.timer.start()],
	
	#
	
	[40, func some_big_asteroid(): some_big_asteroid_spawner.timer.start()],
	[45, func no_more_asteroid(): some_big_asteroid_spawner.timer.stop()],
	
	#
	
	[50, func some_big_asteroid(): some_big_asteroid_spawner.timer.start()],
	
	#
	
	[75, func no_more_asteroid(): some_big_asteroid_spawner.timer.stop()],
	
	#
	
	[150, func some_big_asteroid(): some_big_asteroid_spawner.timer.start()],
	
	#
	
	[200, func end_on_wave(): 
	some_asteroid_spawner.timer.stop()
	some_big_asteroid_spawner.timer.stop()
	#
	ended.emit()
	]
	,
]

func _ready():
	ship_spawner.timer.stop()
	
	some_asteroid_spawner.timer.stop()
	some_asteroid_spawner.asteroid_sizes = [Asteroid.AsteroidSize.SMALL]
	
	some_big_asteroid_spawner.timer.stop()
	some_big_asteroid_spawner.asteroid_sizes = [Asteroid.AsteroidSize.MEDIUM, Asteroid.AsteroidSize.LARGE]

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

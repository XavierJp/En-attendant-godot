extends EntitySpawner

const ghost_asset = preload("res://scenes/player/ghost_player.tscn")	
const small_ship_asset = preload("res://scenes/enemies/small_ship.tscn")
const big_ship_asset = preload("res://scenes/enemies/big_ship.tscn")
const asteroid_asset = preload("res://scenes/enemies/asteroid.tscn")

#
#
#

func _ready():
	initial_timer = 1

func _on_timer_timeout():
	var asteroid = asteroid_asset.instantiate()
	asteroid.position.y = randi_range(-500, 500)
	asteroid.size = Asteroid.AsteroidSize.values().pick_random()
	spawn_asteroid(asteroid)

#
# From EntitySpawner
#

func update_timer():
	$Timer.wait_time = initial_timer / ((Store.position_score / 3) + 1) 

#
#
#

func spawn_asteroid(asteroid: Asteroid):
	asteroid.exploded.connect(func on_exploded(size: Asteroid.AsteroidSize, pos: Vector2) -> void: 
		match size:
			Asteroid.AsteroidSize.MEDIUM:
				spawn_asteroid(
					create_asteroid(
						Asteroid.AsteroidSize.SMALL, 
						pos
					)
				)
				spawn_asteroid(
					create_asteroid(
						Asteroid.AsteroidSize.SMALL, 
						pos
					)
				)
			Asteroid.AsteroidSize.LARGE:
				spawn_asteroid(
					create_asteroid(
						Asteroid.AsteroidSize.MEDIUM, 
						pos
					)
				)
				spawn_asteroid(
					create_asteroid(
						Asteroid.AsteroidSize.MEDIUM, 
						pos
					)
				)
	)
	
	self.add_child(asteroid)

func create_asteroid(size: Asteroid.AsteroidSize, pos: Vector2) -> Asteroid:
	var asteroid = asteroid_asset.instantiate()
	asteroid.position = pos
	asteroid.size = size
	return asteroid

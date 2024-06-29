extends EntitySpawner

const ghost_asset = preload("res://scenes/player/ghost_player.tscn")	
const small_ship_asset = preload("res://scenes/enemies/small_ship.tscn")
const big_ship_asset = preload("res://scenes/enemies/big_ship.tscn")
const asteroid_asset = preload("res://scenes/enemies/asteroid.tscn")

#
#
#

func _ready():
	initial_timer = 4

func _on_timer_timeout():
	var asteroid = asteroid_asset.instantiate()
	asteroid.position.y = randi_range(-1000, 1000)
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
	print("spawn_asteroid", asteroid, asteroid.size)
	asteroid.exploded.connect(func on_exploded(size: Asteroid.AsteroidSize, pos: Vector2) -> void: 
		print("exploded", size, pos)
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
	var rotation_offset = randf_range(PI / 8, PI / 4)
	asteroid.position = pos
	asteroid.initial_move_angle = rotation_offset
	asteroid.size = size
	return asteroid

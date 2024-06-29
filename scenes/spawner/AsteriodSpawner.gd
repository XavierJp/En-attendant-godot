extends EntitySpawner

const ghost_asset = preload("res://scenes/player/ghost_player.tscn")	
const small_ship_asset = preload("res://scenes/enemies/small_ship.tscn")
const big_ship_asset = preload("res://scenes/enemies/big_ship.tscn")
const asteroid_asset = preload("res://scenes/enemies/asteroid.tscn")


func update_timer():
	$Timer.wait_time = initial_timer / ((Store.position_score / 3) + 1) 

func _ready():
	initial_timer = 4

func spawn_asteroid(asteroid):
	asteroid.position.y = randi_range(-1000, 1000)
	self.add_child(asteroid)

func _on_timer_timeout():
	spawn_asteroid(asteroid_asset.instantiate())

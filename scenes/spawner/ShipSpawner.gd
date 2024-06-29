extends EntitySpawner

const small_ship_asset = preload("res://scenes/enemies/small_ship.tscn")
const big_ship_asset = preload("res://scenes/enemies/big_ship.tscn")

func update_timer():
	@warning_ignore("integer_division")
	$Timer.wait_time = initial_timer / (Store.position_score + 1) 

func _ready():
	initial_timer = 1

func spawn_enemy(new_enemy):
	new_enemy.position.y = randi_range(-1000, 1000)
	self.add_child(new_enemy)

func _on_timer_timeout():
	var should_spaw_bigger_ship =  Store.position_score > 15 and randi() % 20 == 0

	if (should_spaw_bigger_ship) :
		spawn_enemy(big_ship_asset.instantiate())
		
	spawn_enemy(small_ship_asset.instantiate())

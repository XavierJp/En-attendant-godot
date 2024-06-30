class_name ShipSpawner extends EntitySpawner

const small_ship_asset = preload("res://scenes/enemies/small_ship.tscn")
const big_ship_asset = preload("res://scenes/enemies/big_ship.tscn")
const middle_ship_asset = preload("res://scenes/enemies/middle_ship_enemy.tscn")

func update_timer():
	@warning_ignore("integer_division")
	self.timer.wait_time = initial_timer / (Store.position_score + 1) 

func _ready():
	initial_timer = 1

func spawn_enemy(new_enemy):
	new_enemy.position.y = randi_range(-1000, 1000)
	self.add_child(new_enemy)

func _on_timer_timeout():
	var should_spaw_bigger_ship =  randf() < (0.10 + Store.position_score / 1000)
	
	if (should_spaw_bigger_ship) :
		spawn_enemy(big_ship_asset.instantiate())

	var should_spaw_middle_ship =  Store.position_score > 15 and randi() % 5 == 0
	
	if (should_spaw_middle_ship) :
		spawn_enemy(middle_ship_asset.instantiate())
		
	spawn_enemy(small_ship_asset.instantiate())

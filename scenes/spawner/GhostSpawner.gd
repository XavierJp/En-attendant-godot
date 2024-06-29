extends EntitySpawner

const ghost_asset = preload("res://scenes/player/ghost_player.tscn")	

func _process(delta):
	if Input.is_action_just_pressed("call_ghost"):
		if Store.ghost_gauge == Store.max_ghost_gauge && Store.has_ghost():
			spawn_ghost(Store.ghost_run)
			Store.ghost_spawned_counter += 1
			Store.ghost_gauge = 0

func spawn_ghost(inputs: PackedVector2Array):
	var ghost = ghost_asset.instantiate()
	ghost.set_inputs(inputs)
	self.add_child(ghost)
	for weapon in ghost.inventory.create_weapons():
		ghost.add_child(weapon)

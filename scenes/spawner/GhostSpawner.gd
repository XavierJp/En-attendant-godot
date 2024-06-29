extends EntitySpawner

const ghost_asset = preload("res://scenes/player/ghost_player.tscn")	

func _ready():
	for inputs in Store.All_runs :
		spawn_ghost(inputs)

func spawn_ghost(inputs: PackedVector2Array):
	var ghost = ghost_asset.instantiate()
	ghost.set_inputs(inputs)
	self.add_child(ghost)

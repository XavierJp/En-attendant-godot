extends Enemy

func _ready():
	speed = 100000
	health = 500
	
	player = get_node("/root/Level/Camera2D/HumanPlayer")

func loot_nitro_on_death():
	Store.add_nitro_boost(1)

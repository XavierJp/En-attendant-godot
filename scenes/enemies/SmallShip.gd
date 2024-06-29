extends Enemy

func _ready():
	speed = 5000
	health = 200
	
	player = get_node("/root/Level/Camera2D/HumanPlayer")

func loot_nitro_on_death():
	Store.add_nitro_boost(1)

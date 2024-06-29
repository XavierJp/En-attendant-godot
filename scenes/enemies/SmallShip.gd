extends EntityEnemy

func _ready():
	speed = 5000
	health = 200
	
	player = get_node("/root/Level/Camera2D/HumanPlayer")

func increase_ghost_gauge():
	Store.increase_ghost_gauge(10)

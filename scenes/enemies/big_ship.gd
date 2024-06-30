extends EntityEnemy

func increase_ghost_gauge():
	Store.increase_ghost_gauge(100)

func _ready():
	speed = 2000
	health = 2000
	player = get_node("/root/Level/Camera2D/HumanPlayer")


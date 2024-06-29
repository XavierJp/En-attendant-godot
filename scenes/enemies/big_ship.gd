extends EntityEnemy

func increase_ghost_gauge():
	Store.increase_ghost_gauge(100)

func _ready():
	speed = 2000
	health = 2000
	player = get_node("/root/Level/Camera2D/HumanPlayer")

func move(delta: float):
	var direction = global_position.direction_to(player.global_position)
	var distance = global_position.distance_to(player.global_position)
	velocity = direction * speed * (3 if distance > 500 else 1) * delta
	rotation = direction.angle()
	move_and_slide()

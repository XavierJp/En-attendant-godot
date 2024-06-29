extends Enemy

func loot_nitro_on_death():
	Store.add_nitro_boost(10)

func _ready():
	const speed = 100000
	var health = 1000
	player = get_node("/root/Level/Camera2D/HumanPlayer")

func move(delta: float):
	var direction = global_position.direction_to(player.global_position)
	var distance = global_position.distance_to(player.global_position)
	velocity = direction * speed * (3 if distance > 500 else 1) * delta
	rotation = direction.angle()
	move_and_slide()

extends CharacterBody2D

const speed = 30000
var health = 5
var player

func _ready():
	player = get_node("/root/Level/Player")
	
func _process(delta):
	var direction = global_position.direction_to(player.global_position)
	var distance = global_position.distance_to(player.global_position)
	velocity = direction * speed * (3 if distance > 500 else 1) * delta
	rotation = direction.angle()
	move_and_slide()

func take_damage(damage):
	health -= damage
	if health == 0:
		queue_free()


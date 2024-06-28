extends CharacterBody2D
class_name Enemy

const speed = 30000
var health = 50
var player

func _ready():
	player = get_node("/root/Level/Player")

func _process(delta: float):
	move(delta)

func move(delta: float):
	pass
	
func take_damage(damage):
	health -= damage
	if health <= 0:
		queue_free()




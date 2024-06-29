extends CharacterBody2D
class_name Enemy

var speed = 300
var health = 50
var player

func loot_nitro_on_death():
	pass # default

func _ready():
	player = get_node("/root/Level/HumanPlayer")
	
func _process(delta: float):
	move(delta)

func move_towards_player(delta:float):	
	var direction = global_position.direction_to(player.global_position)
	var distance = global_position.distance_to(player.global_position)
	
	var multiplier = 1 + (500 if is_nan(distance) else distance) / 500
	velocity = direction * speed * multiplier * delta
	
	rotation = direction.angle()
	move_and_slide()

func move(delta: float):
	# default move
	move_towards_player(delta)
	
func take_damage(damage):
	health -= damage
	if health <= 0:
		self.loot_nitro_on_death()
		Store.kill_score += 1 
		queue_free()




extends CharacterBody2D
class_name EntityEnemy

var speed = 3000
var health = 50
var max_health = 50
var player

func increase_ghost_gauge():
	pass # default

func _ready():
	player = get_node("/root/Level/HumanPlayer")
	
func _process(delta: float):
	move(delta)

func move_towards_player(delta:float):	
	var direction = global_position.direction_to(player.global_position)
	var distance = global_position.distance_to(player.global_position)
	
	var multiplier = 1 + distance / 500
	velocity = direction * speed * multiplier * delta
	
	rotation = direction.angle()
	move_and_slide()

func move(delta: float):
	# default move
	move_towards_player(delta)
	
func take_damage(damage):
	health -= damage
	update_health_bar()
	if health <= 0:
		self.increase_ghost_gauge()
		Store.kill_score += 1 
		queue_free()

func update_health_bar():
	$Health100.visible = float(health) / float(max_health) >= 1
	$Health80.visible = float(health) / float(max_health) >= 0.8
	$Health60.visible = float(health) / float(max_health) >= 0.6
	$Health40.visible = float(health) / float(max_health) >= 0.4
	$Health20.visible = float(health) / float(max_health) >= 0.2
	


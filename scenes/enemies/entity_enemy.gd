extends CharacterBody2D
class_name EntityEnemy

signal enemy_destroyed(position)

var speed = 3000
var health = 50
var current_health = -1
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
	
	$HealthBar.rotation = - direction.angle()
	move_and_slide()

func move(delta: float):
	# default move
	move_towards_player(delta)
	
func take_damage(damage):
	# init on first damage
	if(current_health == -1):
		current_health = health

	current_health = max(0, current_health -damage)
	update_health_bar()
	if current_health == 0:
		self.increase_ghost_gauge()
		Store.kill_score += 1 
		get_node("/root/Level/Camera2D/ExplosionSpawner").spawn_explosion(self.position+self.get_parent().position)
		queue_free()

func update_health_bar():
	$HealthBar.value = float(current_health) / float(health)*100



func _on_enemy_destroyed(position):
	pass # Replace with function body.

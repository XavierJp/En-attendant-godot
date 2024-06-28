extends PlayerShip

func _ready():
	get_node("Score").text = str(0)
	
func _physics_process(delta):
	var direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	OneHistory.record_direction(direction)
	velocity = direction * speed * delta
	move_and_slide()
	
	# damages taken
	var overlapping_bodies = %HitBox.get_overlapping_bodies()
	var overlapping_enemies =  overlapping_bodies.filter(func(body): return body.has_method("take_damage"))
	if overlapping_enemies.size() > 0:
		health -= overlapping_enemies.size()
		print(health)
		get_node('ProgressBar2').value = health
		
		if health <= 0:
			OneHistory.end_of_chapiter()
			get_tree().change_scene_to_file("res://scenes/UIs/game_over.tscn")
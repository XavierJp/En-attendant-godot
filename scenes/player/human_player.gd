extends PlayerShip
	
func _physics_process(delta):
	var direction = Input.get_vector("0", "ui_right", "ui_up", "ui_down")
	Store.record_direction(direction)
	velocity = direction * speed * delta
	move_and_slide()

	Store.position_score = max(global_position.x / 1000,Store.position_score )
	
	# damages taken
	var overlapping_bodies = %HitBox.get_overlapping_bodies()
	var overlapping_enemies =  overlapping_bodies.filter(func(body): return body.has_method("take_damage"))
	if overlapping_enemies.size() > 0:
		health -= overlapping_enemies.size()
		print(health)
		get_node("VBoxContainer2/ProgressBar2").value = health
		
		if health <= 0:
			Store.end_run()
			get_tree().change_scene_to_file("res://scenes/UIs/game_over.tscn")

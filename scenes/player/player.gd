extends CharacterBody2D

var health = 100

func _physics_process(delta):
	var direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = direction * 600
	move_and_slide()
		
	var overlapping_bodies = %HitBox.get_overlapping_bodies()
	var overlapping_enemies =  overlapping_bodies.filter(func(body): return body.has_method("take_damage"))
	
	if overlapping_enemies.size() > 0:
		health -= overlapping_enemies.size()
		print(health)
		get_node("ProgressBar2").value = health
		if health <= 0.0:
			queue_free()
			print("game OVER !!!!")

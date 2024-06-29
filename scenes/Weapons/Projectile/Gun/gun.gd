extends EntityProjectileWeapon

var angles = [-100, -50, 0, 50, 100]

func _on_bullet_timer_timeout():
	var bullet = preload("res://scenes/Weapons/Projectile/bullet.tscn")
	for angle in angles:
		var new_bullet = bullet.instantiate()
		new_bullet.angle = angle
		$ProjectileStartPosition.add_child(new_bullet)

extends EntityProjectileWeapon

var angles = [-100, 0, 100]

func _on_bullet_timer_timeout():
	var bullet = preload("res://scenes/Weapons/Projectile/bullet.tscn")
	for angle in angles:
		var new_bullet = bullet.instantiate()
		new_bullet.angle = angle
		$ProjectileStartPosition.add_child(new_bullet)

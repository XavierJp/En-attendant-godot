extends EntityProjectileWeapon

var angles = [-100, -50, 0, 50, 100]
var damage = 100

func _on_bullet_timer_timeout():
	var bullet = preload("res://scenes/Weapons/Projectile/bullet.tscn")
	for angle in angles:
		var new_bullet = bullet.instantiate()
		new_bullet.angle = angle
		new_bullet.damage = damage
		$ProjectileStartPosition.add_child(new_bullet)

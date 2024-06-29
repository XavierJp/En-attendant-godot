class_name Gun extends EntityProjectileWeapon

var damage = 100
var level = 1

func angles():
	if level == 1:
		return [0]
	elif level == 2:
		return [-PI/4,0,PI/4]
	elif level == 3:
		return [-PI/4,-PI/16,PI/16,PI/4]
	elif level == 4:
		return [-100, -50, 0, 50, 100]

func _on_bullet_timer_timeout():
	var bullet = preload("res://scenes/Weapons/Projectile/bullet.tscn")
	for angle in angles():
		var new_bullet = bullet.instantiate()
		new_bullet.angle = angle
		new_bullet.damage = damage
		$ProjectileStartPosition.add_child(new_bullet)

func upgrade():
	level+=1


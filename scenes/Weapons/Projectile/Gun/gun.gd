class_name Gun extends EntityProjectileWeapon

var angles = [0]
var damage = 100


func _on_bullet_timer_timeout():
	var bullet = preload("res://scenes/Weapons/Projectile/bullet.tscn")
	for angle in angles:
		var new_bullet = bullet.instantiate()
		new_bullet.angle = angle
		new_bullet.damage = damage
		$ProjectileStartPosition.add_child(new_bullet)

func upgrade():
	damage = damage * 2
	upgrade_angles()

func upgrade_angles():
	var level = len(angles)
	if level == 1:
		angles = [-30,30]
	elif level == 2:
		angles = [-50,0,50]
	elif level == 3:
		angles = [-30,30]
	elif level == 4:
		angles = [-100, -50, 0, 50, 100]

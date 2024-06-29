extends CharacterBody2D
class_name PlayerShip

var health = 100
var speed = 60000

func _on_bullet_timer_timeout():
	var bullet = preload("res://scenes/Weapons/Projectile/bullet.tscn")
	for angle in [100, 0, -100]:
		var new_bullet = bullet.instantiate()
		new_bullet.angle = angle
		$ProjectileStartPosition.add_child(new_bullet)

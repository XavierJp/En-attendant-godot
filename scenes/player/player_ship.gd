extends CharacterBody2D
class_name PlayerShip

var health = 100
var speed = 60000






func _on_bullet_timer_timeout():
	var bullet = preload("res://scenes/Weapons/bullet.tscn")
	var new_bullet = bullet.instantiate()
	$ProjectileStartPosition.add_child(new_bullet)

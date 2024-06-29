extends Node2D

class_name EntityProjectileWeapon

var wait_time = 0.1

func _ready():
	$BulletTimer.wait_time = wait_time

func _on_bullet_timer_timeout():
	pass

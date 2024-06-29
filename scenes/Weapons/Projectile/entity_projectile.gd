class_name EntityProjectileWeapon extends Node2D

var wait_time = 0.1

func _ready():
	$BulletTimer.wait_time = wait_time

func _on_bullet_timer_timeout():
	pass

extends Node2D

const explosion_animation = preload("res://scenes/explosions/explosion_animation.tscn")

func spawn_explosion(position):
	var animation = explosion_animation.instantiate()
	animation.position = position
	self.add_child(animation)


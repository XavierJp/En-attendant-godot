extends Area2D

const damage = 50

func _process(_delta):
	for body in self.get_overlapping_bodies():
		if body.has_method("take_damage"):
			body.take_damage(damage)

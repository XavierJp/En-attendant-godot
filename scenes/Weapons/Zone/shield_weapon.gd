class_name Shield extends Area2D

var damage = 25

var level = 1

func _process(_delta):
	for body in self.get_overlapping_bodies():
		if body.has_method("take_damage"):
			body.take_damage(damage*level)

func upgrade():
	level+=1

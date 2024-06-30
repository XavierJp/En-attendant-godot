class_name Shield extends Area2D

var damage = 6

var level = 1

func _process(_delta):
	var s = 1+(float(level)-1)/4
	self.scale = Vector2(s,s)
	for body in self.get_overlapping_bodies():
		if body.has_method("take_damage"):
			body.take_damage(damage*level)

func upgrade():
	level+=1

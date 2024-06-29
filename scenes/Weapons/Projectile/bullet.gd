extends Area2D

var travelled_distance = 0
const SPEED = 2000
const RANGE = 12000
var damage = 25
var angle = 0

func _process(delta):
	rotation = angle
	var direction = Vector2(cos(angle), sin(angle))
	position += direction * SPEED * delta
	travelled_distance += SPEED * delta
	if travelled_distance > RANGE:
		queue_free()

func _on_body_entered(body):
	queue_free()
	if body.has_method("take_damage"):
		body.take_damage(damage)

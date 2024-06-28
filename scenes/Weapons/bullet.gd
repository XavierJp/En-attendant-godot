extends Area2D

var travelled_distance = 0
const SPEED = 1000
const RANGE = 1200
# Called when the node enters the scene tree for the first time.

func _process(delta):
	var direction = Vector2.RIGHT
	position += direction * SPEED * delta
	travelled_distance += SPEED * delta
	if travelled_distance > RANGE:
		queue_free()

extends Camera2D

const speed = 600

func _process(delta):
	position.x += delta * speed

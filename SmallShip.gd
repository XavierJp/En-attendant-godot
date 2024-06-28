extends Enemy

func _ready():
	const speed = 100000
	var health = 500
	player = get_node("/root/Level/Player")

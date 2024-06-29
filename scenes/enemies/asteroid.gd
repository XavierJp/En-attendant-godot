class_name Asteroid extends RigidBody2D

enum AsteroidSize {SMALL, MEDIUM, LARGE}

signal exploded(size: Asteroid.AsteroidSize, pos: Vector2,  points: int)

const BASE_SPEED: float = 5.0

@onready var sprite: Sprite2D = $Sprite2D
@onready var cshape: CollisionShape2D = $CollisionShape2D

@export var size: AsteroidSize = AsteroidSize.LARGE

var max_speed: float = BASE_SPEED
var initial_move_angle: float = 0.0

#
#
#

func _process(delta: float) -> void:
	if freeze:
		freeze = false
		apply_central_impulse(randf_range(max_speed * 0.6, max_speed) * Vector2.UP.rotated(initial_move_angle))	

func _ready():
	freeze = true
	initial_move_angle = randf_range(0.0, 1.0)
	angular_velocity = randf_range(0.0, max_speed)
	rotation = initial_move_angle
	
	match size:
		AsteroidSize.MEDIUM:
			mass *= 2
			sprite.scale *=2
			cshape.scale *=2
		AsteroidSize.LARGE:
			mass *= 4
			sprite.scale *=4
			cshape.scale *=4
	print("Asteroid ", "(size: ", size, ")", "(position: ", position, ")")

#
#
#

func take_damage(damage: int) -> void:
	exploded.emit(size, position)
	queue_free()

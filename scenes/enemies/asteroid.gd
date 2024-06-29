class_name Asteroid extends RigidBody2D

enum AsteroidSize {SMALL, MEDIUM, LARGE}

signal exploded(pos: Vector2, new_rotation: float, size: Asteroid.AsteroidSize, points: int)

const BASE_SPEED: float = 25.0

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

func take_damage(damage: int) -> void:
	queue_free()


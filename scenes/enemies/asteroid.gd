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


func _ready():
	linear_velocity=Vector2(0,0)
	angular_velocity = randf_range(0.0, max_speed)
	initial_move_angle = randf_range(-PI/4 , PI/4)	
	var direction = Vector2.LEFT.rotated(initial_move_angle)*mass*400
	linear_velocity = direction
	
	match size:
		AsteroidSize.MEDIUM:
			mass *= 2
			sprite.scale *=2
			cshape.scale *=2
		AsteroidSize.LARGE:
			mass *= 4
			sprite.scale *=4
			cshape.scale *=4

#
#
#

func take_damage(damage: int) -> void:
	exploded.emit(size, position)
	queue_free()

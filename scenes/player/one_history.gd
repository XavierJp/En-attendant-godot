extends Node

var Bible = []
var current_chapiter = PackedVector2Array([])
var page = 0
	

# Called when the node enters the scene tree for the first time.
func _ready():
	print("One History ready")

func end_of_chapiter():
	print("The chapiter ", page, " ends with ", current_chapiter.size(), " entries")
	page += 1;
	Bible.append(current_chapiter);
	current_chapiter = PackedVector2Array([])

func record_direction(direction: Vector2):
	current_chapiter.append(direction)
extends CharacterBody2D
class_name Ghost

var speed = 60000
var delta_index = 0
var direction = Vector2(0, 0);
var input_array = PackedVector2Array([])


func _physics_process(delta):
	if delta_index >= input_array.size() :
		print("Jean mich is dead ")
		queue_free()
		return
	direction = input_array[delta_index]
	delta_index+=1;
	velocity = direction * speed * delta
	move_and_slide()

func set_inputs(inputs: PackedVector2Array):
	input_array = inputs;

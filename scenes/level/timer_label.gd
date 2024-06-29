extends Label

var time = 0
var timer_on = false

# Called when the node enters the scene tree for the first time.
func _ready():
	timer_on = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(timer_on):
		time += delta

	var mils = fmod(time,1)*1000
	var secs = fmod(time,60)
	var mins = fmod(time,60*60) /60
	var time_passed = "%02d : %02d : %03d" % [mins,secs,mils]
	text = time_passed

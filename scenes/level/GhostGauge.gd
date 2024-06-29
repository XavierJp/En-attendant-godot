extends VBoxContainer


func _ready(): 
	if(Store.has_ghost()):
		self.show()
	else:
		$'GhostGaugeBar'.hide()

	$'GhostAvailability'.hide()

func _process(delta):
	if(Store.ghost_gauge==Store.max_ghost_gauge and Store.has_ghost()):
		$'GhostAvailability'.show()
	else:
		$'GhostAvailability'.hide()

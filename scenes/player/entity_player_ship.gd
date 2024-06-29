extends CharacterBody2D
class_name EntityPlayerShip

var health = 100
var speed = 60000

func _ready():
	for weapon in Inventory.get_weapons():
		self.add_child(weapon)


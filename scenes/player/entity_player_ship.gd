extends CharacterBody2D
class_name EntityPlayerShip

var health = 100
var speed = 60000
var inventory = Inventory.new()

func _ready():
	for weapon in inventory.weapons:
		self.add_child(weapon)


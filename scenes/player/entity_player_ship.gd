extends CharacterBody2D
class_name EntityPlayerShip

var health = 100
var speed = 60000
var inventory = Inventory.new()

func _process(delta):
	for weapon in self.inventory.weapons:
		if Store.get_score() > 10 ** (weapon.level):
			weapon.upgrade()

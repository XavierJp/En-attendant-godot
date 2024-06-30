class_name Inventory extends Node

var weapons = []
var blueprints=[
	[1, preload("res://scenes/Weapons/Projectile/Gun/gun.tscn")],
	[1, preload("res://scenes/Weapons/Zone/shield_weapon.tscn")]
]

func equip(player):
	for blueprint in blueprints:
		var weapon = blueprint[1].instantiate()
		player.add_child(weapon)
		weapon.level = blueprint[0]
		weapons.append(weapon)

#func instantiate_projectile_weapon():
	#var gun = preload("res://scenes/Weapons/Projectile/Gun/gun.tscn")
	#return gun.instantiate()
	#
#func instantiate_shield_weapon():
	#var shield = preload("res://scenes/Weapons/Zone/shield_weapon.tscn")
	#return shield.instantiate()
#
#func create_weapons():
	#weapons.append(instantiate_projectile_weapon())
	#weapons.append(instantiate_shield_weapon())
	#return weapons


class_name Inventory extends Node

var weapons = []

func instantiate_projectile_weapon():
	var gun = preload("res://scenes/Weapons/Projectile/Gun/gun.tscn")
	return gun.instantiate()
	
func instantiate_shield_weapon():
	var shield = preload("res://scenes/Weapons/Zone/shield_weapon.tscn")
	return shield.instantiate()

func create_weapons():
	weapons.append(instantiate_projectile_weapon())
	weapons.append(instantiate_shield_weapon())
	return weapons


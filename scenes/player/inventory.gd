extends Node


func projectile_weapon():
	var gun = preload("res://scenes/Weapons/Projectile/Gun/gun.tscn")
	return gun.instantiate()
	
func shield_weapon():
	var shield = preload("res://scenes/Weapons/Zone/shield_weapon.tscn")
	return shield.instantiate()

func get_weapons():
	var weapons = []	
	weapons.append(projectile_weapon())
	weapons.append(shield_weapon())
	return weapons


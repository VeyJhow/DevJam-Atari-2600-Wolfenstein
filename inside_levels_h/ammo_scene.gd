extends Node2D

signal add_ammo
signal add_hit

@onready var ammo = $ammo

func _on_ammo_body_entered(body):
	if body is player_grey:
		add_ammo.emit()
		ammo.queue_free()

func _on_enemy_hit():
	add_hit.emit()

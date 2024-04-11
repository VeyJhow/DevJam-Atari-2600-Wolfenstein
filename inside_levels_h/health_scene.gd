extends Node2D

signal add_health
signal add_hit

@onready var health = $health

func _on_health_body_entered(body):
	if body is player_grey:
		add_health.emit()
		health.queue_free()

func _on_enemy_hit():
	add_hit.emit()

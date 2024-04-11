extends Node2D

signal add_points
signal add_hit

@onready var item = $item

func _on_item_body_entered(body):
	if body is player_grey:
		add_points.emit()
		item.queue_free()

func _on_enemy_hit():
	add_hit.emit()

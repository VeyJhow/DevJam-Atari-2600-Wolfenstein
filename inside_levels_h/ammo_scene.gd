extends Node2D

signal add_ammo
signal add_hit

@onready var ammo = $ammo
@onready var enemy = $enemy
@onready var enemy2 = $enemy2
@onready var enemy3 = $enemy3
var player

func _ready():
	player = get_parent().find_child("player_grey")

func _process(_delta):
	enemy.track_position = player.position
	enemy2.track_position = player.position
	enemy3.track_position = player.position

func _on_ammo_body_entered(body):
	if body is player_grey:
		add_ammo.emit()
		ammo.queue_free()

func _on_enemy_hit():
	add_hit.emit()

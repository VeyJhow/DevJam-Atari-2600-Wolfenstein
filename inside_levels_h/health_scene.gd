extends Node2D

signal add_health
signal add_hit

@onready var health = $health
@onready var enemy = $enemy
@onready var enemy2 = $enemy2
@onready var enemy3 = $enemy3
@onready var sprite = $enemy/Sprite2D
@onready var sprite2 = $enemy2/Sprite2D
@onready var sprite3 = $enemy3/Sprite2D
@onready  var timer = $Timer
@onready var chase_enemy = $chase_enemy
var player

func _ready():
	player = get_parent().find_child("player_grey")

func _process(_delta):
	enemy.track_position = player.position
	enemy2.track_position = player.position
	enemy3.track_position = player.position
	chase_enemy.track_position = player.position
	if player.position.x < enemy.position.x:
		sprite.flip_h = true
	elif player.position.x < enemy.position.x:
		sprite.flip_h = false
	if player.position < enemy2.position:
		sprite2.flip_h = true
	elif player.position.x < enemy2.position.x:
		sprite2.flip_h = false
	if player.position < enemy3.position:
		sprite3.flip_h = true
	elif player.position.x < enemy3.position.x:
		sprite3.flip_h = false

func _on_health_body_entered(body):
	if body is player_grey:
		add_health.emit()
		health.queue_free()

func _on_enemy_hit():
	add_hit.emit()

func _on_chase_spawn_body_entered(body):
	if body is player_grey:
		chase_enemy.position = Vector2(0,324)
		timer.start()

func _on_timer_timeout():
	chase_enemy.speed = 150
	chase_enemy.sprite.show()
	chase_enemy.hit_area.set_collision_mask_value(1,true)

func _on_chase_enemy_hit():
	add_hit.emit()

func _on_chase_spawn_body_exited(body):
	if body is player_grey:
		timer.stop()

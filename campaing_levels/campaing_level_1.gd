extends Node2D

@onready var player = $player_grey
@onready var camera = $Camera2D
@onready var timer = $invulnerability_timer
@onready var timer2 = $end_level
@onready var patrol_bot = $patrol_bot
@onready var patrol_bot2 = $patrol_bot2
@onready var patrol_bot3 = $patrol_bot3
@onready var patrol_bot4 = $patrol_bot4
@onready var patrol_bot5 = $patrol_bot5
@onready var patrol_bot6 = $patrol_bot6
@onready var label = $Camera2D/player_status/Label
@onready var label2 = $Camera2D/player_status/Label2
@onready var game_over_window = $Camera2D/game_over_arcade
var vertical_level_1 = preload("res://campaing_levels/c_inside_v_1.tscn")
var vertical_level_2 = preload("res://campaing_levels/c_inside_v_13.tscn")
var horizontal_level_1 = preload("res://campaing_levels/c_inside_h_9.tscn")
var horizontal_level_2 = preload("res://campaing_levels/c_inside_h_2.tscn")

func _ready():
	var level_v_1 = vertical_level_1.instantiate()
	var level_v_2 = vertical_level_2.instantiate()
	var level_h_1 = horizontal_level_1.instantiate()
	var level_h_2 = horizontal_level_2.instantiate()
	add_child(level_v_1)
	add_child(level_v_2)
	add_child(level_h_1)
	add_child(level_h_2)
	level_v_1.add_points.connect(add_points_to_player)
	level_v_2.add_health.connect(add_health_to_player)
	level_h_1.add_ammo.connect(add_ammo_to_player)
	level_h_2.add_points.connect(add_points_to_player)
	level_v_1.add_hit.connect(player_hurt)
	level_v_2.add_hit.connect(player_hurt)
	level_h_1.add_hit.connect(player_hurt)
	level_h_2.add_hit.connect(player_hurt)
	level_v_1.position = Vector2(1200,0)
	level_v_2.position = Vector2(1200,748)
	level_h_1.position = Vector2(1200,1496)
	level_h_2.position = Vector2(1200,2244)

func _process(_delta):
	label.text = str(player.ammo)
	label2.text = str(player.health)
	if player.health == 0:
		game_over()

func game_over():
	player.running = false
	patrol_bot.running = false
	patrol_bot2.running = false
	patrol_bot3.running = false
	patrol_bot4.running = false
	patrol_bot5.running = false
	patrol_bot6.running = false
	game_over_window.show()

func _on_patrol_bot_hit():
	player_hurt()

func player_hurt():
	player.health -= 1

func player_invulnerability():
	player.set_collision_layer_value(5,false)
	timer.start()

func _on_invulnerability_timer_timeout():
	player.set_collision_layer_value(5,true)

func _on_return_area_1_body_entered(body):
	if body is player_grey:
		player.position = Vector2(272,144)
		camera.position = Vector2(642,324)
		player_invulnerability()
		check_player_points()

func _on_return_area_2_body_entered(body):
	if body is player_grey:
		player.position = Vector2(272,87)
		camera.position = Vector2(642,324)
		player_invulnerability()
		check_player_points()

func check_player_points():
	if player.points == 2:
		player.running = false
		patrol_bot.running = false
		patrol_bot2.running = false
		patrol_bot3.running = false
		patrol_bot4.running = false
		patrol_bot5.running = false
		patrol_bot6.running = false
		timer2.start()

func _on_return_area_3_body_entered(body):
	if body is player_grey:
		player.position = Vector2(882,145)
		camera.position = Vector2(642,324)
		player_invulnerability()
		check_player_points()

func _on_return_area_4_body_entered(body):
	if body is player_grey:
		player.position = Vector2(882,86)
		camera.position = Vector2(642,324)
		player_invulnerability()
		check_player_points()

func _on_return_area_5_body_entered(body):
	if body is player_grey:
		player.position = Vector2(191,530)
		camera.position = Vector2(642,324)
		player_invulnerability()
		check_player_points()

func _on_return_area_6_body_entered(body):
	if body is player_grey:
		player.position = Vector2(355,530)
		camera.position = Vector2(642,324)
		player_invulnerability()
		check_player_points()

func _on_return_area_7_body_entered(body):
	if body is player_grey:
		player.position = Vector2(804,530)
		camera.position = Vector2(642,324)
		player_invulnerability()
		check_player_points()

func _on_return_area_8_body_entered(body):
	if body is player_grey:
		player.position = Vector2(962,530)
		camera.position = Vector2(642,324)
		player_invulnerability()
		check_player_points()

func _on_enter_vertical_1_body_entered(body):
	if body is player_grey:
		player.position = Vector2(1776,623)
		camera.position = Vector2(1842,324)

func _on_enter_vertical_2_body_entered(body):
	if body is player_grey:
		player.position = Vector2(1776,25)
		camera.position = Vector2(1842,324)

func _on_enter_vertical_3_body_entered(body):
	if body is player_grey:
		player.position = Vector2(1776,1371)
		camera.position = Vector2(1842,1072)

func _on_enter_vertical_4_body_entered(body):
	if body is player_grey:
		player.position = Vector2(1776,773)
		camera.position = Vector2(1842,1072)

func _on_enter_vertical_5_body_entered(body):
	if body is player_grey:
		player.position = Vector2(1303,1820)
		camera.position = Vector2(1842,1820)

func _on_enter_vertical_6_body_entered(body):
	if body is player_grey:
		player.position = Vector2(2249,1820)
		camera.position = Vector2(1842,1820)

func _on_enter_vertical_7_body_entered(body):
	if body is player_grey:
		player.position = Vector2(1303,2568)
		camera.position = Vector2(1842,2568)

func _on_enter_vertical_8_body_entered(body):
	if body is player_grey:
		player.position = Vector2(2249,2568)
		camera.position = Vector2(1842,2568)

func add_points_to_player():
	player.points += 1

func add_health_to_player():
	player.health += 1

func add_ammo_to_player():
	player.ammo += 4

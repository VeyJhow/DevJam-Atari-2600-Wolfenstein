extends Node2D

var score_points : int = 0
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
@onready var symbol = $symbol
@onready var symbol2 = $symbol2
@onready var symbol3 = $symbol3
@onready var symbol4 = $symbol4
@onready var audioplay = $AudioStreamPlayer
var options_scene = preload("res://scenes/menus/options_menu.tscn")
var vertical_point_levels : Array = [preload("res://inside_levels_v/inside_level_v_1.tscn"),
preload("res://inside_levels_v/inside_level_v_2.tscn"),
preload("res://inside_levels_v/inside_level_v_3.tscn"),
preload("res://inside_levels_v/inside_level_v_4.tscn"),
preload("res://inside_levels_v/inside_level_v_5.tscn"),
preload("res://inside_levels_v/inside_level_v_6.tscn"),
preload("res://inside_levels_v/inside_level_v_7.tscn"),
preload("res://inside_levels_v/inside_level_v_8.tscn")]
var vertical_ammo_levels : Array = [preload("res://inside_levels_v/inside_level_v_9.tscn"),
preload("res://inside_levels_v/inside_level_v_10.tscn"),
preload("res://inside_levels_v/inside_level_v_11.tscn"),
preload("res://inside_levels_v/inside_level_v_12.tscn")]
var vertical_health_levels : Array = [preload("res://inside_levels_v/inside_level_v_13.tscn"),
preload("res://inside_levels_v/inside_level_v_14.tscn"),
preload("res://inside_levels_v/inside_level_v_15.tscn"),
preload("res://inside_levels_v/inside_level_v_16.tscn")]
var horizintal_point_levels : Array = [preload("res://inside_levels_h/inside_level_h_1.tscn"),
preload("res://inside_levels_h/inside_level_h_2.tscn"),
preload("res://inside_levels_h/inside_level_h_3.tscn"),
preload("res://inside_levels_h/inside_level_h_4.tscn"),
preload("res://inside_levels_h/inside_level_h_5.tscn"),
preload("res://inside_levels_h/inside_level_h_6.tscn"),
preload("res://inside_levels_h/inside_level_h_7.tscn"),
preload("res://inside_levels_h/inside_level_h_8.tscn")]
var horizontal_ammo_levels : Array = [preload("res://inside_levels_h/inside_level_h_9.tscn"),
preload("res://inside_levels_h/inside_level_h_10.tscn"),
preload("res://inside_levels_h/inside_level_h_11.tscn"),
preload("res://inside_levels_h/inside_level_h_12.tscn")]
var horizontal_health_levels : Array = [preload("res://inside_levels_h/inside_level_h_13.tscn"),
preload("res://inside_levels_h/inside_level_h_14.tscn"),
preload("res://inside_levels_h/inside_level_h_15.tscn"),
preload("res://inside_levels_h/inside_level_h_16.tscn")]
var random_level : Array = ["res://level_1.tscn",
"res://level_2.tscn",
"res://level_3.tscn",
"res://level_4.tscn",
"res://level_5.tscn",
"res://level_6.tscn",
"res://level_7.tscn",
"res://level_8.tscn"]

func _ready():
	score_points = PointsManager.score
	player.ammo = PointsManager.ammo
	player.health = PointsManager.health
	var vertical_level_1 = vertical_health_levels.pick_random().instantiate()
	var vertical_level_2 = vertical_point_levels.pick_random().instantiate()
	var horizontal_level_1 = horizintal_point_levels.pick_random().instantiate()
	var horizontal_level_2 = horizontal_ammo_levels.pick_random().instantiate()
	add_child(vertical_level_1)
	add_child(vertical_level_2)
	add_child(horizontal_level_1)
	add_child(horizontal_level_2)
	vertical_level_1.add_health.connect(add_health_to_player)
	vertical_level_2.add_points.connect(add_points_to_player)
	horizontal_level_1.add_points.connect(add_points_to_player_2)
	horizontal_level_2.add_ammo.connect(add_ammo_to_player)
	vertical_level_1.add_hit.connect(player_hurt)
	vertical_level_2.add_hit.connect(player_hurt)
	horizontal_level_1.add_hit.connect(player_hurt)
	horizontal_level_2.add_hit.connect(player_hurt)
	vertical_level_1.position = Vector2(1200,0)
	vertical_level_2.position = Vector2(1200,748)
	horizontal_level_1.position = Vector2(1200,1496)
	horizontal_level_2.position = Vector2(1200,2244)
	patrol_bot.three = true
	patrol_bot2.three = true
	patrol_bot3.three = true
	patrol_bot4.three = true
	patrol_bot5.three = true
	patrol_bot6.three = true
	audioplay.play()

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

func _on_enter_vertical_1_body_entered(body):
	if body is player_grey:
		player.position = Vector2(1776,623)
		camera.position = Vector2(1842,324)

func _on_enter_vertical_2_body_entered(body):
	if body is player_grey:
		player.position = Vector2(1776,25)
		camera.position = Vector2(1842,324)

func _on_return_area_1_body_entered(body):
	if body is player_grey:
		player.position = Vector2(873,154)
		camera.position = Vector2(642,324)
		player_invulnerability()
		check_player_points()

func _on_return_area_2_body_entered(body):
	if body is player_grey:
		player.position = Vector2(873,91)
		camera.position = Vector2(642,324)
		player_invulnerability()
		check_player_points()

func _on_enter_vertical_3_body_entered(body):
	if body is player_grey:
		player.position = Vector2(1776,1371)
		camera.position = Vector2(1842,1072)

func _on_enter_vertical_4_body_entered(body):
	if body is player_grey:
		player.position = Vector2(1776,773)
		camera.position = Vector2(1842,1072)

func _on_return_area_3_body_entered(body):
	if body is player_grey:
		player.position = Vector2(280,558)
		camera.position = Vector2(642,324)
		player_invulnerability()
		check_player_points()

func _on_return_area_4_body_entered(body):
	if body is player_grey:
		player.position = Vector2(280,491)
		camera.position = Vector2(642,324)
		player_invulnerability()
		check_player_points()

func _on_enter_vertical_5_body_entered(body):
	if body is player_grey:
		player.position = Vector2(1303,1820)
		camera.position = Vector2(1842,1820)

func _on_enter_vertical_6_body_entered(body):
	if body is player_grey:
		player.position = Vector2(2249,1820)
		camera.position = Vector2(1842,1820)

func _on_return_area_5_body_entered(body):
	if body is player_grey:
		player.position = Vector2(205,124)
		camera.position = Vector2(642,324)
		player_invulnerability()
		check_player_points()

func _on_return_area_6_body_entered(body):
	if body is player_grey:
		player.position = Vector2(371,124)
		camera.position = Vector2(642,324)
		player_invulnerability()
		check_player_points()

func _on_enter_vertical_7_body_entered(body):
	if body is player_grey:
		player.position = Vector2(1303,2568)
		camera.position = Vector2(1842,2568)

func _on_enter_vertical_8_body_entered(body):
	if body is player_grey:
		player.position = Vector2(2249,2568)
		camera.position = Vector2(1842,2568)

func _on_return_area_7_body_entered(body):
	if body is player_grey:
		player.position = Vector2(786,530)
		camera.position = Vector2(642,324)
		player_invulnerability()
		check_player_points()

func _on_return_area_8_body_entered(body):
	if body is player_grey:
		player.position = Vector2(951,530)
		camera.position = Vector2(642,324)
		player_invulnerability()
		check_player_points()

func add_points_to_player():
	player.points += 1
	score_points += 100
	symbol2.hide()

func add_points_to_player_2():
	player.points += 1
	score_points += 100
	symbol3.hide()

func add_health_to_player():
	player.health += 1
	score_points += 50
	symbol.hide()

func add_ammo_to_player():
	player.ammo += 4
	score_points += 50
	symbol4.hide()

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

func _on_end_level_timeout():
	PointsManager.score = score_points
	PointsManager.ammo = player.ammo
	PointsManager.health = player.health
	PointsManager.save_score()
	get_tree().change_scene_to_file(random_level.pick_random())

func _on_options_button_pressed():
	var options = options_scene.instantiate()
	add_child(options)
	get_tree().paused = true

func _on_audio_stream_player_finished():
	audioplay.play()

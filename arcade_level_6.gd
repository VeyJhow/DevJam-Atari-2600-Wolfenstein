extends Node2D

@onready var player = $player_grey
@onready var camera = $Camera2D
@onready var timer = $invulnerability_timer
var vertical_levels : Array = [preload("res://inside_levels_v/inside_level_v_1.tscn"),
preload("res://inside_levels_v/inside_level_v_2.tscn"),
preload("res://inside_levels_v/inside_level_v_3.tscn"),
preload("res://inside_levels_v/inside_level_v_4.tscn"),
preload("res://inside_levels_v/inside_level_v_5.tscn"),
preload("res://inside_levels_v/inside_level_v_6.tscn"),
preload("res://inside_levels_v/inside_level_v_7.tscn"),
preload("res://inside_levels_v/inside_level_v_8.tscn"),
preload("res://inside_levels_v/inside_level_v_9.tscn"),
preload("res://inside_levels_v/inside_level_v_10.tscn"),
preload("res://inside_levels_v/inside_level_v_11.tscn"),
preload("res://inside_levels_v/inside_level_v_12.tscn"),
preload("res://inside_levels_v/inside_level_v_13.tscn"),
preload("res://inside_levels_v/inside_level_v_14.tscn"),
preload("res://inside_levels_v/inside_level_v_15.tscn"),
preload("res://inside_levels_v/inside_level_v_16.tscn")]
var horizintal_levels : Array = [preload("res://inside_levels_h/inside_level_h_1.tscn"),
preload("res://inside_levels_h/inside_level_h_2.tscn"),
preload("res://inside_levels_h/inside_level_h_3.tscn"),
preload("res://inside_levels_h/inside_level_h_4.tscn"),
preload("res://inside_levels_h/inside_level_h_5.tscn"),
preload("res://inside_levels_h/inside_level_h_6.tscn"),
preload("res://inside_levels_h/inside_level_h_7.tscn"),
preload("res://inside_levels_h/inside_level_h_8.tscn"),
preload("res://inside_levels_h/inside_level_h_9.tscn"),
preload("res://inside_levels_h/inside_level_h_10.tscn"),
preload("res://inside_levels_h/inside_level_h_11.tscn"),
preload("res://inside_levels_h/inside_level_h_12.tscn"),
preload("res://inside_levels_h/inside_level_h_13.tscn"),
preload("res://inside_levels_h/inside_level_h_14.tscn"),
preload("res://inside_levels_h/inside_level_h_15.tscn"),
preload("res://inside_levels_h/inside_level_h_16.tscn")]

func _ready():
	var vertical_level_1 = vertical_levels.pick_random().instantiate()
	var vertical_level_2 = vertical_levels.pick_random().instantiate()
	var horizontal_level_1 = horizintal_levels.pick_random().instantiate()
	var horizontal_level_2 = horizintal_levels.pick_random().instantiate()
	add_child(vertical_level_1)
	add_child(vertical_level_2)
	add_child(horizontal_level_1)
	add_child(horizontal_level_2)
	vertical_level_1.position = Vector2(1200,0)
	vertical_level_2.position = Vector2(1200,748)
	horizontal_level_1.position = Vector2(1200,1496)
	horizontal_level_2.position = Vector2(1200,2244)

func _on_patrol_bot_hit():
	game_over()

func game_over():
	print("over")

func player_invulnerability():
	player.set_collision_layer_value(5,false)
	timer.start()

func _on_invulnerability_timer_timeout():
	player.set_collision_layer_value(5,true)

func _on_enter_vertical_1_body_entered(body):
	if body is player_grey:
		player.position = Vector2(1776,623)
		camera.position = Vector2(1776,324)

func _on_enter_vertical_2_body_entered(body):
	if body is player_grey:
		player.position = Vector2(1776,25)
		camera.position = Vector2(1776,324)

func _on_return_area_1_body_entered(body):
	if body is player_grey:
		player.position = Vector2(883,145)
		camera.position = Vector2(576,324)
		player_invulnerability()

func _on_return_area_2_body_entered(body):
	if body is player_grey:
		player.position = Vector2(883,84)
		camera.position = Vector2(576,324)
		player_invulnerability()

func _on_enter_vertical_3_body_entered(body):
	if body is player_grey:
		player.position = Vector2(1776,1371)
		camera.position = Vector2(1776,1072)

func _on_enter_vertical_4_body_entered(body):
	if body is player_grey:
		player.position = Vector2(1776,773)
		camera.position = Vector2(1776,1072)

func _on_return_area_3_body_entered(body):
	if body is player_grey:
		player.position = Vector2(269,561)
		camera.position = Vector2(576,324)
		player_invulnerability()

func _on_return_area_4_body_entered(body):
	if body is player_grey:
		player.position = Vector2(269,501)
		camera.position = Vector2(576,324)
		player_invulnerability()

func _on_enter_vertical_5_body_entered(body):
	if body is player_grey:
		player.position = Vector2(1303,1820)
		camera.position = Vector2(1776,1820)

func _on_enter_vertical_6_body_entered(body):
	if body is player_grey:
		player.position = Vector2(2249,1820)
		camera.position = Vector2(1776,1820)

func _on_return_area_5_body_entered(body):
	if body is player_grey:
		player.position = Vector2(796,530)
		camera.position = Vector2(576,324)
		player_invulnerability()

func _on_return_area_6_body_entered(body):
	if body is player_grey:
		player.position = Vector2(964,530)
		camera.position = Vector2(576,324)
		player_invulnerability()

func _on_enter_vertical_7_body_entered(body):
	if body is player_grey:
		player.position = Vector2(1303,2568)
		camera.position = Vector2(1776,2568)

func _on_enter_vertical_8_body_entered(body):
	if body is player_grey:
		player.position = Vector2(2249,2568)
		camera.position = Vector2(1776,2568)

func _on_return_area_7_body_entered(body):
	if body is player_grey:
		player.position = Vector2(190,114)
		camera.position = Vector2(576,324)
		player_invulnerability()

func _on_return_area_8_body_entered(body):
	if body is player_grey:
		player.position = Vector2(353,114)
		camera.position = Vector2(576,324)
		player_invulnerability()

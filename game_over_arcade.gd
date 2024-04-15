extends Node2D

@onready var label = $Label
var random_scene : Array = ["res://level_1.tscn",
"res://level_2.tscn",
"res://level_3.tscn",
"res://level_4.tscn",
"res://level_5.tscn",
"res://level_6.tscn",
"res://level_7.tscn",
"res://level_8.tscn"]
var points

func _ready():
	points = PointsManager.score

func _process(_delta):
	label.text = str(points)

func _on_button_pressed():
	PointsManager.score = 0
	PointsManager.save_score()
	get_tree().change_scene_to_file(random_scene.pick_random())

func _on_button_2_pressed():
	get_tree().change_scene_to_file("res://menu.tscn")

extends Node2D

@onready var animplay = $AnimationPlayer
@onready var colorrect = $ColorRect
var random_scene : Array = ["res://level_1.tscn",
"res://level_2.tscn",
"res://level_3.tscn",
"res://level_4.tscn",
"res://level_5.tscn",
"res://level_6.tscn",
"res://level_7.tscn",
"res://level_8.tscn"]

func _ready():
	animplay.play("fade")

func _on_animation_player_animation_finished(_fade):
	colorrect.position = Vector2(-648,0)

func _on_button_pressed():
	get_tree().change_scene_to_file("res://tutorial.tscn")

func _on_button_2_pressed():
	get_tree().change_scene_to_file(random_scene.pick_random())

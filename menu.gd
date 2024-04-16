extends Node2D

@onready var logo = $Sprite2D2
@onready var button1 = $Button
@onready var button2 = $Button2
@onready var label = $Button/Sprite2D2/Label
@onready var audioplay = $AudioStreamPlayer
var options_scene = preload("res://scenes/menus/options_menu.tscn")

func _ready():
	get_tree().paused = false
	label.text = str(PointsManager.high_score)
	audioplay.play()

func _input(event):
	if event is InputEventKey:
		if Input.is_action_pressed("ui_accept") and event.pressed:
			logo.hide()
			button1.show()
			button2.show()

func _on_button_pressed():
	PointsManager.score = 0
	PointsManager.health = 3
	PointsManager.ammo = 0
	PointsManager.save_score()
	get_tree().change_scene_to_file("res://intro.tscn")

func _on_button_2_pressed():
	var options = options_scene.instantiate()
	add_child(options)
	get_tree().paused = true

func _on_audio_stream_player_finished():
	audioplay.play()

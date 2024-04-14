extends Node2D

@onready var label = $Label
var points

func _ready():
	points = PointsManager.score

func _process(_delta):
	label.text = str(points)

func _on_button_pressed():
	pass

func _on_button_2_pressed():
	pass

extends Node2D

func game_over():
	print("over")

func _on_patrol_bot_hit():
	game_over()

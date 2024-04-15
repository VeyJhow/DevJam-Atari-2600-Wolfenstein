extends Control

@onready var margin1 = $MarginContainer
@onready var margin2 = $MarginContainer2

func _on_voltar_pressed():
	queue_free()
	get_tree().paused = false

func _on_button_pressed():
	margin1.hide()
	margin2.show()

func _on_button_2_pressed():
	get_tree().change_scene_to_file("res://menu.tscn")

func _on_button_pressed_voltar():
	margin1.show()
	margin2.hide()

func _on_quit_pressed():
	get_tree().quit()

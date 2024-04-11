extends Control


func _on_jogar_pressed():
	get_tree().change_scene_to_file("res://scenes/menus/modos.tscn")



func _on_opções_pressed():
	get_tree().change_scene_to_file("res://scenes/menus/options_menu.tscn")



func _on_sair_pressed():
	get_tree().quit()

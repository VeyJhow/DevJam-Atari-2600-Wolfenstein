extends CharacterBody2D

class_name player_grey

var speed = 300

func _physics_process(_delta):
	var direction = Input.get_vector("ui_left","ui_right","ui_up","ui_down")
	velocity = speed * direction
	move_and_slide()

extends CharacterBody2D

class_name player_grey

var speed = 300
var health = 3
var ammo = 0
var points = 0
var running : bool = true

func _physics_process(_delta):
	if running:
		var direction = Input.get_vector("ui_left","ui_right","ui_up","ui_down")
		velocity = speed * direction
		move_and_slide()

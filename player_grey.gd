extends CharacterBody2D

class_name player_grey

var speed = 300
var points = 0
var health = 0
var ammo = 0
var running : bool = true

func _physics_process(_delta):
	if running:
		var direction = Input.get_vector("ui_left","ui_right","ui_up","ui_down")
		velocity = speed * direction
		move_and_slide()

func _process(_delta):
	if health > 4:
		health = 4
	elif health < 0:
		health = 0
	if ammo > 8:
		ammo = 8

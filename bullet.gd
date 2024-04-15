extends CharacterBody2D

class_name bullet

var speed = 2000
var direction
@onready var timer = $Timer
@onready var sprite = $Sprite2D

func _physics_process(_delta):
	velocity = direction * speed
	move_and_slide()
	match direction:
		Vector2.LEFT:
			sprite.set_rotation(- PI / 2)
		Vector2.RIGHT:
			sprite.set_rotation(PI / 2)
		Vector2.UP:
			sprite.set_rotation(0)
		Vector2.DOWN:
			sprite.set_rotation(- PI)

func _on_timer_timeout():
	queue_free()

extends CharacterBody2D

class_name knife

var speed = 500
var direction
@onready var timer = $Timer
@onready var sprite = $Sprite2D

func _physics_process(_delta):
	velocity = direction * speed
	move_and_slide()
	match direction:
		Vector2.LEFT:
			sprite.set_rotation(PI)
		Vector2.RIGHT:
			sprite.set_rotation(0)
		Vector2.UP:
			sprite.set_rotation(- PI / 2)
		Vector2.DOWN:
			sprite.set_rotation(PI / 2)

func _on_timer_timeout():
	queue_free()

extends CharacterBody2D

signal hit

@onready var sprite = $Sprite2D
@onready var sprite2 = $Sprite2D2
@onready var sprite3 = $Sprite2D3
var speed = 300
var direction
var array_direction : Array = [Vector2.LEFT,Vector2.RIGHT,Vector2.UP,Vector2.DOWN]
var running : bool = true
var one : bool
var two : bool
var three : bool

func _ready():
	velocity = array_direction.pick_random() * 0.01

func _physics_process(_delta):
	if running:
		var collision = move_and_collide(velocity * speed)
		if collision:
			var variavel = array_direction.pick_random()
			velocity = variavel * 0.01
			match variavel:
				Vector2.LEFT:
					sprite.set_rotation(PI / 2)
					sprite2.set_rotation(PI / 2)
					sprite3.set_rotation(PI / 2)
				Vector2.RIGHT:
					sprite.set_rotation(- PI / 2)
					sprite2.set_rotation(- PI / 2)
					sprite3.set_rotation(- PI / 2)
				Vector2.UP:
					sprite.set_rotation(- PI)
					sprite2.set_rotation(- PI)
					sprite3.set_rotation(- PI)
				Vector2.DOWN:
					sprite.set_rotation(0)
					sprite2.set_rotation(0)
					sprite3.set_rotation(0)

func _process(_delta):
	if one:
		sprite.show()
		sprite2.hide()
		sprite3.hide()
	elif two:
		sprite.hide()
		sprite2.show()
		sprite3.hide()
	elif three:
		sprite.hide()
		sprite2.hide()
		sprite3.show()

func _on_player_area_body_entered(body):
	if body is player_grey:
		hit.emit()

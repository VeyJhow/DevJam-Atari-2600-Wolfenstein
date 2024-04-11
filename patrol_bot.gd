extends CharacterBody2D

signal hit

var speed = 300
var direction
var array_direction : Array = [Vector2.LEFT,Vector2.RIGHT,Vector2.UP,Vector2.DOWN]
var running : bool = true

func _ready():
	velocity = array_direction.pick_random() * 0.01

func _physics_process(_delta):
	if running:
		var collision = move_and_collide(velocity * speed)
		if collision:
			var variavel = array_direction.pick_random()
			velocity = variavel * 0.01

func _on_player_area_body_entered(body):
	if body is player_grey:
		hit.emit()

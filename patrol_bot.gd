extends CharacterBody2D

signal hit

var speed = 20
var speed_adjust = 0.2

func _ready():
	start_patrol()

func _physics_process(_delta):
	var collision = move_and_collide(velocity * speed)
	if collision:
		velocity = velocity.bounce(collision.get_normal())

func _on_player_collision_body_entered(body):
	if body is player_grey:
		hit.emit()

func start_patrol():
	randomize()
	velocity.x = [-0.5,0.5][randi() % 2 ] * speed_adjust
	velocity.y = [-0.5,0.5][randi() % 2 ] * speed_adjust

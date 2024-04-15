extends CharacterBody2D

signal hit

var speed = 150
var track_position
var player_position
var self_position
var chase = false
var direction
@onready var search_area = $search_area
@onready var sprite = $Sprite2D
@onready var sprite2 = $Sprite2D2
@onready var hit_area = $hit_area
@onready var animplay = $AnimationPlayer
@onready var audioplay = $AudioStreamPlayer

func _ready():
	player_position = track_position
	self_position = Vector2(self.global_position) 
	search_area.body_entered.connect(_on_SearchArea_entered)
	search_area.body_exited.connect(_on_SearchArea_exited)

func _process(_delta):
	player_position = track_position
	self_position = Vector2(self.global_position)
	if(chase == true):
		direction = self_position.direction_to(player_position) 
		velocity = direction * speed
		move_and_slide()

func _on_SearchArea_entered(body):
	if body is player_grey :
		chase = true

func _on_SearchArea_exited(body):
	if body is player_grey :
		chase = false

func _on_hit_area_body_entered(body):
	if body is player_grey:
		hit.emit()

func _on_hurt_area_body_entered(body):
	if body is knife:
		enable_enemy()
	elif body is bullet:
		enable_enemy()

func enable_enemy():
	speed = 0
	sprite.hide()
	hit_area.set_collision_mask_value(1,false)
	sprite2.show()
	animplay.play("death")
	audioplay.play()

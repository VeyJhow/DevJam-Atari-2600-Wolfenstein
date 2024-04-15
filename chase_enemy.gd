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
@onready var hit_area = $hit_area

func _ready():
	player_position = track_position
	self_position = Vector2(self.global_position) 
	search_area.body_entered.connect(_on_SearchArea_entered)
	search_area.body_exited.connect(_on_SearchArea_exited)
	enable_enemy()

func _process(_delta):
	player_position = track_position
	self_position = Vector2(self.global_position)
	if(chase == true):
		direction = self_position.direction_to(player_position) 
		velocity = direction * speed
		move_and_slide()

func _on_SearchArea_entered(body):
	if body is player_grey:
		chase = true

func _on_SearchArea_exited(body):
	if body is player_grey:
		enable_enemy()

func _on_hit_area_body_entered(body):
	if body is player_grey:
		hit.emit()

func enable_enemy():
	speed = 0
	sprite.hide()
	hit_area.set_collision_mask_value(1,false)


extends CharacterBody2D

class_name player_grey

@onready var sprite = $Sprite2D
@onready var timer = $Timer
@onready var audioplay = $AudioStreamPlayer
@onready var audioplay2 = $AudioStreamPlayer2
var knife_scene = preload("res://faca.tscn")
var gun_scene = preload("res://bullet.tscn")
var speed = 200
var points = 0
var health = 3
var ammo = 0
var running : bool = true
var can_shoot : bool = true
var weapon : bool = false
var direction

func _physics_process(_delta):
	if running:
		direction = Input.get_vector("ui_left","ui_right","ui_up","ui_down")
		velocity = speed * direction
		move_and_slide()
		match direction:
			Vector2.LEFT:
				sprite.set_rotation(PI / 2)
			Vector2.RIGHT:
				sprite.set_rotation(- PI / 2)
			Vector2.UP:
				sprite.set_rotation(- PI)
			Vector2.DOWN:
				sprite.set_rotation(0)

func _process(_delta):
	if health > 4:
		health = 4
	elif health < 0:
		health = 0
	if ammo > 0:
		weapon = true
	elif ammo > 8:
		ammo = 8
	else:
		weapon = false

func _input(event):
	if can_shoot == true:
		if weapon == false:
			if event is InputEventKey:
				if Input.is_action_just_pressed("ui_accept"):
					enable_can_shoot()
					summon_weapon_knife()
					audioplay.play()
		elif weapon == true:
			if event is InputEventKey:
				if Input.is_action_just_pressed("ui_accept"):
					enable_can_shoot()
					summon_weapon_gun()
					audioplay2.play()
					ammo -= 1

func enable_can_shoot():
	can_shoot = false
	timer.start()

func summon_weapon_knife():
	var summon_knife = knife_scene.instantiate()
	add_child(summon_knife)
	summon_knife.direction = self.direction
	summon_knife.timer.start()
	if self.direction == Vector2.ZERO:
		summon_knife.direction = Vector2.DOWN

func summon_weapon_gun():
	var summon_bullet = gun_scene.instantiate()
	add_child(summon_bullet)
	summon_bullet.direction = self.direction
	summon_bullet.timer.start()
	if self.direction == Vector2.ZERO:
		summon_bullet.direction = Vector2.DOWN

func _on_timer_timeout():
	can_shoot = true

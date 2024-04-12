extends CharacterBody2D

var speed = 70
var player
var player_position
var self_position
var chase = false
var direction
@onready var search_area = $search_area
# Called when the node enters the scene tree for the first time.
func _ready():
	player = get_node("../player_grey")
	
	player_position = Vector2(player.global_position)
	self_position = Vector2(self.global_position) 
	
	search_area.body_entered.connect(_on_SearchArea_entered)
	search_area.body_exited.connect(_on_SearchArea_exited)
	
	#$search_area.connect("area_exited", self, "_on_SearchArea_exited")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	player_position = Vector2(player.global_position)
	self_position = Vector2(self.global_position)
	if(chase == true):
		direction = self_position.direction_to(player_position) 
		velocity = direction * speed
		move_and_slide()
	#print(distance)
	print(chase)
	
func _on_SearchArea_entered(body):
	print("entrou")
	if body is player_grey :
		chase = true

func _on_SearchArea_exited(body):
	print("Saiu")
	if body is player_grey :
		chase = false


extends Node

const SAVEFILE = "user://player_score.save"
var score = 0
var ammo = 0
var health = 3

func _ready():
	load_score()

func save_score():
	var file = FileAccess.open(SAVEFILE,FileAccess.WRITE_READ)
	file.store_32(score)
	file.store_32(ammo)
	file.store_32(ammo)

func load_score():
	var file = FileAccess.open(SAVEFILE,FileAccess.READ)
	if FileAccess.file_exists(SAVEFILE):
		score = file.get_32()

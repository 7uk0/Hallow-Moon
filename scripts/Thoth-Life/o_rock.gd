extends Node2D

func _ready():
	var sprite = $spRocks
	var total_frames = sprite.hframes * sprite.vframes
	sprite.frame = randi() % total_frames

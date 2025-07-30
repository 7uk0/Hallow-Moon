extends Node

var rockScene = preload("res://scenes/objects/oRock.tscn")
var squibScene = preload("res://scenes/objects/oSquib.tscn")

func _ready():
	randomize()
	
	var roomW = get_viewport().get_visible_rect().size.x
	var roomH = get_viewport().get_visible_rect().size.y
	for n in randi_range(20,30):
		var rock = rockScene.instantiate()
		rock.global_position.x = randi_range(0,roomW)
		rock.global_position.y = randi_range(0,roomH)
		add_child(rock)
	for n in randi_range(4,15):
		var squib = squibScene.instantiate()
		squib.global_position.x = randi_range(0,roomW)
		squib.global_position.y = randi_range(0,roomH)
		add_child(squib)

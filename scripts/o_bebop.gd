extends Node2D

var spd = 30

func _process(delta): 
	if Input.is_action_pressed("ui_up"):
		position.y -= spd * delta
	if Input.is_action_pressed("ui_down"):
		position.y += spd * delta
	if Input.is_action_pressed("ui_right"):
		position.x += spd * delta
	if Input.is_action_pressed("ui_left"):
		position.x -= spd * delta

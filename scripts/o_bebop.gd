extends Node2D
var spd = 30
func _process(delta): 
	if Input.is_key_pressed(KEY_W):
		position.y -= spd * delta
	if Input.is_key_pressed(KEY_S):
		position.y += spd * delta
	if Input.is_key_pressed(KEY_D):
		position.x += spd * delta
	if Input.is_key_pressed(KEY_A):
		position.x -= spd * delta

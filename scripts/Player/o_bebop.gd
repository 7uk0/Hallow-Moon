extends Node2D

var spd = 30 # speed
var fuel = 100.0  # Max fuel
var fuel_consumption_rate = 5.0  # Fuel per second while moving

func _process(delta): 
	var moved = false

	if Input.is_key_pressed(KEY_W):
		position.y -= spd * delta
		moved = true
	if Input.is_key_pressed(KEY_S):
		position.y += spd * delta
		moved = true
	if Input.is_key_pressed(KEY_D):
		position.x += spd * delta
		moved = true
	if Input.is_key_pressed(KEY_A):
		position.x -= spd * delta
		moved = true

	if moved and fuel > 0:
		fuel -= fuel_consumption_rate * delta
		fuel = max(fuel, 0)

	if fuel <= 0:
		spd = 0  

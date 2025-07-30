extends Node2D

@onready var ship           = $Ship
@onready var fuel_bar       = $UI/FuelBar
@onready var stardate_label = $UI/StarDateLabel

# â Gameplay vars â
var max_fuel               := 100.0
var fuel                   := max_fuel
var stardate               := 41000.0
var fuel_consumption_rate  := 5.0     # fuel units per second
var speed                  := 30.0    # ship speed
var time_speed             := 1.0     # stardate units per second

func _ready():
	# Give the bar its boundaries once
	fuel_bar.min_value = 0
	fuel_bar.max_value = max_fuel
	fuel_bar.value     = fuel

func _process(delta):
	var moved = false

	if fuel > 0:
		if Input.is_key_pressed(KEY_W):
			ship.position.y -= speed * delta; moved = true
		if Input.is_key_pressed(KEY_S):
			ship.position.y += speed * delta; moved = true
		if Input.is_key_pressed(KEY_D):
			ship.position.x += speed * delta; moved = true
		if Input.is_key_pressed(KEY_A):
			ship.position.x -= speed * delta; moved = true

		if moved:
			fuel = max(fuel - fuel_consumption_rate * delta, 0)

	# UI updates
	fuel_bar.value = fuel
	stardate += time_speed * delta
	stardate_label.text = "STAR DATE: %.2f\nFUEL: %.1f%%" % [stardate, fuel]

	# DEBUG: print fuel so you can see it in the console
	# print("Fuel = ", fuel)

  

extends Node2D   # Or whatever your root/ship node is

# ——— Constants ———
const MAX_FUEL := 100.0
const FUEL_CONSUMPTION_RATE := 10.0  # fuel units drained per second

# ——— State ———
var fuel := MAX_FUEL

# ——— Node References ———
onready var fuel_bar := $RSolarSystem/UI/FuelBar # ← Make sure this path matches your scene tree

func _ready() -> void:
	# Initialize your bar’s range
	fuel_bar.min_value = 0
	fuel_bar.max_value = MAX_FUEL
	fuel_bar.value = fuel

func _process(delta: float) -> void:
	# Simulate movement input (your real inputs go here)
	var moving := Input.is_action_pressed("move_up") \
				or Input.is_action_pressed("move_down") \
				or Input.is_action_pressed("move_left") \
				or Input.is_action_pressed("move_right")

	# Drain fuel if we’re actually moving
	if moving and fuel > 0:
		fuel = max(fuel - FUEL_CONSUMPTION_RATE * delta, 0)

	# Update the visual gauge every frame
	fuel_bar.value = fuel

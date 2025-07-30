extends Node2D

@onready var ship           = $Ship
@onready var fuel_bar       = $UI/FuelBar
@onready var stardate_label = $UI/StarDateLabel

# — Gameplay Variables —
const MAX_FUEL := 100.0
const FUEL_CONSUMPTION_RATE := 5.0  # per second while moving
const SHIP_SPEED := 30.0            # movement speed
const TIME_SPEED := 1.0             # how fast time progresses

var fuel := MAX_FUEL
var stardate := 41000.0

func _ready() -> void:
	fuel_bar.min_value = 0
	fuel_bar.max_value = MAX_FUEL
	update_ui()

func _process(delta: float) -> void:
	var direction := Vector2.ZERO

	# Movement input
	if Input.is_action_pressed("move_up"):
		direction.y -= 1
	if Input.is_action_pressed("move_down"):
		direction.y += 1
	if Input.is_action_pressed("move_right"):
		direction.x += 1
	if Input.is_action_pressed("move_left"):
		direction.x -= 1

	if direction != Vector2.ZERO and fuel > 0:
		direction = direction.normalized()
		ship.position += direction * SHIP_SPEED * delta
		fuel = max(fuel - FUEL_CONSUMPTION_RATE * delta, 0)

	# Time progresses regardless of movement
	stardate += TIME_SPEED * delta

	update_ui()


func update_ui() -> void:
	fuel_bar.value = fuel
	stardate_label.text = "STAR DATE: %.2f\nFUEL: %.1f%%" % [stardate, fuel]

  

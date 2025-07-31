extends Node2D

var fuel
var fuel_bar
var speed = 30
const MAX_FUEL = 100
const FUEL_CONSUMPTION_RATE = 10 
@export var fuel_bar_path: NodePath

func _ready():
	fuel = MAX_FUEL
	fuel_bar = get_node(fuel_bar_path)
	
func _process(delta): 
	var moved = false

	if Input.is_key_pressed(KEY_W):
		position.y -= speed * delta
		moved = true
	if Input.is_key_pressed(KEY_S):
		position.y += speed * delta
		moved = true
	if Input.is_key_pressed(KEY_D):
		position.x += speed * delta
		moved = true
	if Input.is_key_pressed(KEY_A):
		position.x -= speed * delta
		moved = true

	if moved and fuel > 0:
		fuel -= FUEL_CONSUMPTION_RATE * delta
		fuel = max(fuel, 0)

	if fuel <= 0: speed = 0  
	fuel_bar.value = fuel

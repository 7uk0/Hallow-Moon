extends Node2D
var fuel
var fuel_perc
var speed = 30
const MAX_FUEL = 100
var rotationSpeed = 1
var input_vector = Vector2.ZERO
const FUEL_CONSUMPTION_RATE = 2 
@export var fuel_percentage_path: NodePath 

func _ready():
	fuel = MAX_FUEL
	fuel_perc = get_node(fuel_percentage_path)

func _process(delta): 
	
	#Movement Mechanics
	var moving = false
	if Input.is_key_pressed(KEY_W):
		input_vector.y -= 1
		moving = true
	if Input.is_key_pressed(KEY_S):
		input_vector.y += 1
		moving = true
	if Input.is_key_pressed(KEY_D):
		input_vector.x -= 1
		moving = true
	if Input.is_key_pressed(KEY_A):
		input_vector.x += 1
		moving = true
	if input_vector.x != 0 or input_vector.y != 0:
		input_vector = input_vector.normalized()
		
	if Input.is_key_pressed(KEY_E):
		rotation += rotationSpeed * delta
	if Input.is_key_pressed(KEY_Q):
		rotation -= rotationSpeed * delta
		
	var local_direction = input_vector.rotated(rotation)
	if moving : position += local_direction * speed * delta
	if fuel <= 0: speed = 0
	if moving and fuel > 0:
		fuel -= FUEL_CONSUMPTION_RATE * delta
		fuel = max(fuel, 0)
		fuel_perc.text = str(int((fuel / MAX_FUEL) * 100)) + "%"
	

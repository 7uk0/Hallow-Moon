extends Node2D
var fuel
var fuel_perc
var bebop_flame
var acceleration = 5 
var averageVelocity 
var velocity_vector = Vector2.ZERO
const MAX_FUEL = 100
var rotationSpeed = 1
var input_vector = Vector2.ZERO
const FUEL_CONSUMPTION_RATE = 2 
@export var fuel_percentage_path: NodePath 
@export var velocity_path: NodePath 
@export var bebop_flame_path: NodePath 
func _ready():
	fuel = MAX_FUEL
	fuel_perc = get_node(fuel_percentage_path)
	bebop_flame = get_node(bebop_flame_path)
func _process(delta): 
	var underAcceleration = false
	if input_vector.x != 0 or input_vector.y != 0:
			input_vector = input_vector.normalized()
		
	var local_direction = input_vector.rotated(rotation)
	#Movement Mechanics
	if Input.is_key_pressed(KEY_E):
		rotation += rotationSpeed * delta
	if Input.is_key_pressed(KEY_Q):
		rotation -= rotationSpeed * delta
		
	
	if fuel > 0: 
		if Input.is_key_pressed(KEY_W):
			input_vector.y -= 1
			velocity_vector.y -= acceleration * delta
			underAcceleration = true
		if Input.is_key_pressed(KEY_S):
			input_vector.y += 1
			velocity_vector.y += acceleration * delta
			underAcceleration = true
		if Input.is_key_pressed(KEY_D):
			input_vector.x += 1
			velocity_vector.x += acceleration * delta
			underAcceleration = true
		if Input.is_key_pressed(KEY_A):
			input_vector.x -= 1
			velocity_vector.x -= acceleration * delta
			underAcceleration = true
	
	if underAcceleration : 
		velocity_vector += local_direction
		fuel -= FUEL_CONSUMPTION_RATE * delta
		
	fuel = max(fuel, 0)
	fuel_perc.text = str(int((fuel / MAX_FUEL) * 100)) + "%"
	bebop_flame.visible = underAcceleration
	position += velocity_vector * delta

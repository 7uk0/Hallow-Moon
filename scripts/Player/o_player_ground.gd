extends Node2D
var spd = 60
func _ready():
	$spPlayerGround.play("default")
func _process(delta): 
	if Input.is_action_pressed("ui_up"):
		position.y -= spd * delta
	if Input.is_action_pressed("ui_down"):
		position.y += spd * delta
	if Input.is_action_pressed("ui_right"):
		position.x += spd * delta
	if Input.is_action_pressed("ui_left"):
		position.x -= spd * delta
		
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
		
	if input_vector.length() > 0:
		$spPlayerGround.play("default")
		if input_vector.x > 0:
			$spPlayerGround.flip_h = true
		elif input_vector.x < 0:
			$spPlayerGround.flip_h = false
	else:
		$spPlayerGround.stop()
		$spPlayerGround.frame = 0

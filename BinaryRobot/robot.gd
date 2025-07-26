extends CharacterBody2D

var speed = 20

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Brain.input == str(1):
		$PointLight2D.enabled = true
		Brain.glow = "ON"
		Brain.active = true
	elif Brain.input == str(0):
		$PointLight2D.enabled = false
		Brain.glow = "OFF"
		Brain.active = false
	if Brain.active == true:
		if Brain.input == str(10):
			velocity = transform.y.normalized() * speed
		elif Brain.input == str(1001):
			rotation_degrees -= 45
			Brain.input = ""
		elif Brain.input == str(101):
			rotation_degrees -= 90
			Brain.input = ""
		elif Brain.input == "11":
			rotation_degrees -= 180
			Brain.input = ""
		elif Brain.input == "101010":
			speed = 40
			Brain.input = ""
	move_and_slide()
	if Brain.input != str(11):
		velocity = Vector2.ZERO

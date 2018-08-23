extends KinematicBody2D

const SPEED = 1000
const GRAVITY = 3500
const UP = Vector2(0, -1)
const JUMP_SPEED = 1500

var motion = Vector2()

func _physics_process(delta):
	fall(delta)
	run()
	jump()
	move_and_slide(motion, UP)

func fall(delta):
	if is_on_floor():
		motion.y = 0
	else:
		motion.y += GRAVITY * delta

func run():
	var inputLeft =Input.is_action_pressed("ui_left")
	var inputRight = Input.is_action_pressed("ui_right")

	if inputRight and not inputLeft:
		motion.x = SPEED
		$AnimatedSprite.flip_h = false
		$AnimatedSprite.play("run")
	elif inputLeft and not inputRight:
		motion.x = -SPEED
		$AnimatedSprite.flip_h = true
		$AnimatedSprite.play("run")
	else:
		motion.x = 0 
		$AnimatedSprite.play("idle")

func jump():
	var inputUp = Input.is_action_pressed("ui_up")

	if inputUp and is_on_floor():
		var direction = -1
		motion.y = direction * JUMP_SPEED


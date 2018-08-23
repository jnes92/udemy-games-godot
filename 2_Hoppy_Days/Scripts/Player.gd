extends KinematicBody2D

const SPEED = 750 # in pixels

var motion = Vector2()

func _physics_process(delta):

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


	move_and_slide(motion)
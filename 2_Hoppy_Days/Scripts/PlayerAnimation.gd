extends AnimatedSprite

func update(motion):
	if motion.y < 0:
		play("jump")
	elif motion.x > 0:
		flip_h = false
		play("run")
	elif motion.x < 0:
		flip_h = true
		play("run")
	else :
		play("idle")


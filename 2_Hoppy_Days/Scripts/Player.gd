extends KinematicBody2D

const SPEED = 1000
const GRAVITY = 3500
const UP = Vector2(0, -1)
const JUMP_SPEED = 1500

var motion = Vector2()
export var world_limit = 2000

func _ready():
	Global.Player = self

func _physics_process(delta):
	update_motion(delta)

func _process(delta):
	update_animation(motion)

func update_motion(delta):
	fall(delta)
	run()
	jump()
	move_and_slide(motion, UP)

func update_animation(motion):
	$AnimatedSprite.update(motion)

func fall(delta):
	if is_on_floor() or is_on_ceiling():
		motion.y = 0
	else:
		motion.y += GRAVITY * delta 		# actually move_and_slide uses delta internally, too : so read GRAVITY * delta ^2 -> Accelerating falling

	if position.y > world_limit:
		Global.GameState.end_game()

func run():
	var inputLeft =Input.is_action_pressed("ui_left")
	var inputRight = Input.is_action_pressed("ui_right")

	if inputRight and not inputLeft:
		motion.x = SPEED

	elif inputLeft and not inputRight:
		motion.x = -SPEED

	else:
		motion.x = 0 

func jump():
	var inputUp = Input.is_action_pressed("ui_up")

	if inputUp and is_on_floor():
		Global.jump_sfx.play()
		var direction = -1
		motion.y = direction * JUMP_SPEED

func hurt():
	var direction = -1
	motion.y = direction * JUMP_SPEED

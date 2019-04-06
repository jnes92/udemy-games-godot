extends "res://Scripts/Character.gd"

var motion = Vector2()
var vision_mode_on_change_cooldown = false

enum VISION_MODES {DARK, NIGHTVISION} 
var vision_mode = VISION_MODES.DARK


func _ready():
	Global.Player =  self

func _process(delta):
	update_motion(delta)
	move_and_slide(motion)

func update_motion(delta):
	look_at(get_global_mouse_position())

	if Input.is_action_pressed("ui_up") and not Input.is_action_pressed("ui_down"):
		motion.y = clamp((motion.y - SPEED), - MAX_SPEED, 0)
	elif Input.is_action_pressed("ui_down") and not Input.is_action_pressed("ui_up"):
		motion.y = clamp((motion.y + SPEED), 0 , MAX_SPEED)
	else: 
		motion.y = lerp(motion.y, 0 , FRICTION)

	if Input.is_action_pressed("ui_left") and not Input.is_action_pressed("ui_right"):
		motion.x = clamp(motion.x - SPEED, - MAX_SPEED, 0)
	elif Input.is_action_pressed("ui_right") and not Input.is_action_pressed("ui_left"):
		motion.x = clamp(motion.x + SPEED, 0, MAX_SPEED)
	else: 
		motion.x = lerp(motion.x, 0 , FRICTION)

func _input(event):
	if Input.is_action_pressed("ui_vision_mode_change") and not vision_mode_on_change_cooldown:
		cycle_vision_mode()
		vision_mode_on_change_cooldown = true
		$VisionModeTimer.start()

func cycle_vision_mode():
	print("cycle_vision_mode()", vision_mode)
	if vision_mode == VISION_MODES.DARK:
		get_tree().call_group(Global.GROUP_INTERFACE_ID, "NightVision_mode")
		vision_mode = VISION_MODES.NIGHTVISION
	elif vision_mode == VISION_MODES.NIGHTVISION:
		get_tree().call_group(Global.GROUP_INTERFACE_ID, "DarkVision_mode")
		vision_mode = VISION_MODES.DARK
	print(vision_mode)



func _on_VisionModeTimer_timeout():
	vision_mode_on_change_cooldown = false

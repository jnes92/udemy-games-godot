extends Area2D

export var code_length = 4

var can_click = false
var secret_code 

signal combination

func _ready():
	$Light2D.enabled = true
	generate_secret_code()
	emit_signal("combination", secret_code)

func generate_secret_code():
	var code_generator = get_tree().get_root().find_node("CodeGenerator", true, false)
	secret_code = code_generator.generate_code(code_length)
	set_popup_text()
	
func _on_Computer_body_entered(body):
	can_click = true

func _on_Computer_body_exited(body):
	can_click = false 
	$Light2D.enabled = false
	$CanvasLayer/ComputerPopup.hide()
	
func _input_event(viewport, event, shape_idx):
	if Input.is_mouse_button_pressed(BUTTON_LEFT) and can_click:
		$CanvasLayer/ComputerPopup.popup_centered()
		$Light2D.enabled = true

func set_popup_text():
	$CanvasLayer/ComputerPopup.set_text(secret_code)
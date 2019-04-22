extends "res://Scripts/Door.gd"


func _input_event(viewport, event, shape_idx):
	if Input.is_mouse_button_pressed(BUTTON_LEFT) and is_player_in_range:
		$CanvasLayer/NumberPad.popup_centered()
		
func _on_Door_body_exited(body):
	if body == Global.Player:
		is_player_in_range = false
		$CanvasLayer/NumberPad.hide()
		$CanvasLayer/NumberPad.reset_lock()

func _on_NumberPad_code_correct():
	open_door()


func _on_Computer_combination(code):
	$CanvasLayer/NumberPad.secret_code = code


func _on_ExitDetection_body_entered(body):
	open_door()

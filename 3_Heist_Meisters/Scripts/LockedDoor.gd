extends "res://Scripts/Door.gd"

func _input(event):
	if Input.is_mouse_button_pressed(BUTTON_LEFT) and is_player_in_range:
		$CanvasLayer/NumberPad.popup_centered()
		
func _on_Door_body_exited(body):
	if body == Global.Player:
		is_player_in_range = false
		$CanvasLayer/NumberPad.hide()
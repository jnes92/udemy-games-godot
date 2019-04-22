extends Area2D

var is_player_in_range = false

func _on_Door_body_entered(body):
	if not body == Global.Player:
		open_door()
	else:
		is_player_in_range = true


func _on_Door_body_exited(body):
	if body == Global.Player:
		is_player_in_range = false


func open_door():
	if !$AnimationPlayer.is_playing():
		$AnimationPlayer.play("open")
	
func _input(event):
	if Input.is_mouse_button_pressed(BUTTON_LEFT) and is_player_in_range:
		open_door()
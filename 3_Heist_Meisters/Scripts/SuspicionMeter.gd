extends TextureProgress

export var suspicion_step = 1 # How much suspicion increases everytime we´re seen
export var suspicion_dropoff = 0.25 # How fast suspicion falls

var suspicion = 0

func _process(delta):
	suspicion -= suspicion_dropoff
	suspicion = clamp(suspicion, 0, max_value)
	value = suspicion # Update UI

func player_seen():
	suspicion += suspicion_step
	if suspicion == max_value:
		end_game()
		
func end_game():
	get_tree().quit()
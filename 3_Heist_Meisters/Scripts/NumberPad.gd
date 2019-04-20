extends Popup

onready var display = $VSplitContainer/DisplayContainer/Display
onready var light = $VSplitContainer/ButtonContainer/ButtonGrid/Light

var secret_code = [1,2,3]
var guessed_code = []

func _ready():
	connect_buttons()
	reset_lock()

func connect_buttons():
	for child in $VSplitContainer/ButtonContainer/ButtonGrid.get_children():
		if child is Button:
			child.connect("pressed", self, "_on_Button_pressed", [child.text])
		
func _on_Button_pressed(buttonIdentifier):
	if buttonIdentifier == "Ok":
		check_guess()
	else:
		enter(int(buttonIdentifier))
		
func check_guess():
	if guessed_code == secret_code:
		light.texture = load(Global.green_light)
		$Timer.start()
	else:
		reset_lock()
	
func enter(number):
	guessed_code.append(number)
	update_display()
	
func reset_lock():
	light.texture = load(Global.red_light)
	display.clear()
	guessed_code.clear()
	
	
func update_display():
	display.bbcode_text = "[center]" + PoolStringArray(guessed_code).join("") + "[/center]"
	if guessed_code.size() == secret_code.size():
		check_guess()

func _on_Timer_timeout():
	hide()
	reset_lock()

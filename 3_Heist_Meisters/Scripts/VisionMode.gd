extends CanvasModulate

const DARK = Color("1d177e")
const NIGHTVISION = Color("2dbf55")

func _ready():
	add_to_group(Global.GROUP_INTERFACE_ID)
	color = DARK
	get_tree().call_group(Global.GROUP_CODE_LABELS_ID, "hide")

func NightVision_mode():
	inform_npcs("NightVision_mode")
	color = NIGHTVISION
	play_sfx(Global.sfx_nightvision_on)



func DarkVision_mode():
	inform_npcs("DarkVision_mode")
	color = DARK
	play_sfx(Global.sfx_nightvision_off)

func play_sfx(path):
	$AudioStreamPlayer.stream = load(path)
	$AudioStreamPlayer.play()
	
func inform_npcs(vision_mode):
	get_tree().call_group(Global.GROUP_NPC_ID, vision_mode) 
	get_tree().call_group(Global.GROUP_CODE_LABELS_ID, "show" if vision_mode == "NightVision_mode" else "hide")
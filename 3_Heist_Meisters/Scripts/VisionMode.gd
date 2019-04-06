extends CanvasModulate

const DARK = Color("1d177e")
const NIGHTVISION = Color("2dbf55")


func _ready():
	add_to_group(Global.GROUP_INTERFACE_ID)
	color = DARK

func NightVision_mode():
	color = NIGHTVISION
	play_sfx(Global.sfx_nightvision_on)


func DarkVision_mode():
	color = DARK
	play_sfx(Global.sfx_nightvision_off)

func play_sfx(path):
	$AudioStreamPlayer.stream = load(path)
	$AudioStreamPlayer.play()
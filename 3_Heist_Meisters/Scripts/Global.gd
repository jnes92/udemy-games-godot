extends Node

var Player 
var navigation
var destinations


# Constants
## Groups

const GROUP_INTERFACE_ID = "interface"
const GROUP_NPC_ID = "npc"
const GROUP_CODE_LABELS_ID = "code_labels"

## Asset links - MUST BE CHANGED MANUALLY
var sfx_nightvision_on = "res://SFX/nightvision.wav"
var sfx_nightvision_off = "res://SFX/nightvision_off.wav"

var red_light = "res://GFX/Interface/PNG/dotRed.png"
var green_light = "res://GFX/Interface/PNG/dotGreen.png"
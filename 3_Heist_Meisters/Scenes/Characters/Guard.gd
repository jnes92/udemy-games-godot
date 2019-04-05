extends "res://Scripts/PlayerDetection.gd"

var motion = Vector2()
var possible_destination = []
var path = []
var destination = Vector2()

export var walk_slowdown = 0.5
export var navigation_stop_threshold = 5

onready var navigation = Global.navigation
onready var available_destinations = Global.destinations

func _ready():
	possible_destination = available_destinations.get_children()
	make_path()

func _process(delta):
	navigate()

func navigate():
	destination = path[0]
	var distance_to_destination = position.distance_to(destination)

	if distance_to_destination > navigation_stop_threshold:
		move()
	else:
		update_path()

func move():
	look_at(destination)
	motion = (destination - position).normalized() * (MAX_SPEED * walk_slowdown)

	if is_on_wall():
		make_path()

	move_and_slide(motion)


func make_path():
	randomize()
	var random_destination_index = randi() % possible_destination.size()
	var next_destination = possible_destination[random_destination_index]
	path = navigation.get_simple_path(global_position, next_destination.global_position, false)

func update_path():
	if path.size() == 1:
		if $Timer.is_stopped():
			$Timer.start()
	else:
		path.remove(0)

func _on_Timer_timeout():
	make_path()

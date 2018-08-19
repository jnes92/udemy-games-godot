extends Node2D

var player_words = []
var current_story
var textResources # All the text ressources from json

func _ready():
	set_random_story()
	textResources = get_from_json("other_strings.json");
	$Blackboard/StoryText.text = textResources["intro_text"]
	prompt_player()
	$Blackboard/TextBox.text = ""
	$Blackboard/TextureButton/ButtonLabel.text = "Ok"


func set_random_story():
	var stories = get_from_json("stories.json")
	randomize()
	current_story = stories[randi() % stories.size()]

func get_from_json(filename):
	var file = File.new()
	file.open(filename, File.READ) # TODO: Check for file existing
	var text = file.get_as_text()
	var data = parse_json(text)
	file.close()
	return data

func _on_TextureButton_pressed():
	if is_story_done():
		get_tree().reload_current_scene()
	else:
		var new_text = $Blackboard/TextBox.get_text()
		_on_TextBox_text_entered(new_text)

func _on_TextBox_text_entered(new_text):
	player_words.append(new_text)
	$Blackboard/TextBox.text =""
	$Blackboard/StoryText.clear()
	check_player_word_length()
	
func is_story_done():
	return player_words.size() == current_story.prompt.size()

func prompt_player():
	var next_prompt = current_story["prompt"][player_words.size()]
	$Blackboard/StoryText.text += (textResources["prompt"] % next_prompt)
	
func check_player_word_length():
	if is_story_done():
		tell_story()
	else: 
		prompt_player()
		
func tell_story():
	$Blackboard/StoryText.text = current_story.story % player_words
	$Blackboard/TextureButton/ButtonLabel.text = textResources["again"]
	end_game()
	
func end_game():
	$Blackboard/TextBox.queue_free()
extends Node2D

var player_words = []
var prompt = ["a name", "a job title", "a character property", "an enemy"]
var story = "Once upon a time a Hero called %s wanted to marry the %s, but therefore he needed a lot more %s, so he needed to fight against a %s"

func _ready():
	$Blackboard/StoryText.text = "Welcome to LoonyLips! \n\nWe are going to tell a tory and have a lovely time! \n"+ ("Can I have " + prompt[player_words.size()] + ", please ?")
	$Blackboard/TextBox.text = ""
	$Blackboard/TextureButton/ButtonLabel.text = "Ok"


func _on_TextureButton_pressed():
	if is_story_done():
		get_tree().reload_current_scene()
	else:
		var new_text = $Blackboard/TextBox.get_text()
		_on_TextBox_text_entered(new_text)

func _on_TextBox_text_entered(new_text):
	player_words.append(new_text)
	$Blackboard/TextBox.text =""
	check_player_word_length()
	
func is_story_done():
	return player_words.size() == prompt.size()

func prompt_player():
	$Blackboard/StoryText.text = ("Can I have " + prompt[player_words.size()] + ", please ?")
	
func check_player_word_length():
	if is_story_done():
		tell_story()
	else: 
		prompt_player()
		
func tell_story():
	$Blackboard/StoryText.text =story % player_words
	$Blackboard/TextureButton/ButtonLabel.text = "Again"
	end_game()
	
func end_game():
	$Blackboard/TextBox.queue_free()
extends Node2D

func _ready():
	var prompt = ["Olaf", "SLAUGHTER", "honor", "mice"]
	var story = "Once upon a time a Hero called %s wanted to marry the %s, but therefore he needed a lot more %s, so he needed to fight against a %s"
	# $Blackboard/StoryText.text = story%prompt
	$Blackboard/StoryText.bbcode_text = story%prompt


func _on_TextureButton_pressed():
	var new_text = $Blackboard/TextBox.get_text()
	_on_TextBox_text_entered(new_text)

func _on_TextBox_text_entered(new_text):
	$Blackboard/StoryText.bbcode_text = new_text
	$Blackboard/TextBox.text =""


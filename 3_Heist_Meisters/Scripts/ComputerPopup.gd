extends Popup

func set_text(code):
	var code_as_string = PoolStringArray(code).join("")
	$RichTextLabel.bbcode_text = (
			"Will you stop forgetting your access code? I´ve set it to " 
			+ code_as_string 
			+", but this is the last time")
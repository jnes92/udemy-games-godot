extends Node

func generate_code(digit_length):
	var code = []
	for number in range(digit_length):
		randomize()
		var digit = randi() % 10
		code.append(digit)
	return code
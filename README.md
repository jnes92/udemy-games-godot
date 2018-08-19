# Table of contents:
<!-- @import "[TOC]" {cmd="toc" depthFrom=1 depthTo=6 orderedList=false} -->

<!-- code_chunk_output -->

- [Table of contents:](#table-of-contents)
- [Learning Log](#learning-log)
	- [Section 1](#section-1)
		- [103: Installing GoDot](#103-installing-godot)
		- [105: Hello GoDot.](#105-hello-godot)
	- [Section 2: Loony Lips](#section-2-loony-lips)
		- [207: Game Requirements](#207-game-requirements)
		- [208: Introducing Arrays](#208-introducing-arrays)
		- [209: RichTextLabel](#209-richtextlabel)
		- [210: LineEdit](#210-lineedit)

<!-- /code_chunk_output -->

# Learning Log
## Section 1 
### 103: Installing GoDot 
*(19.08.2018)*


Verfügbar für:
- Windows
- Mac
- Linux

Installation auch über Steam möglich

Versionen:
- Python Script
- C# Support with Mono.

### 105: Hello GoDot. 
*(19.08.2018)*

GoDot related: (GDScript)

- A script with out a node won´t be run
- Press Scene "add" to add nodes: 
    - blue is 2d
    - red is 3d 
- Press Scene "add script" to add first script 

Scripts: 
- pass is like return nothing 

Python:
- is a dynamic typing language
- "#" is for comments
- no curly braces {}, instead use tab indentions

Others:
- cool theme "Alien": Editor Settings -> Theme 



## Section 2: Loony Lips 

### 207: Game Requirements 
*(19.08.2018)*

a word game
- ask for a word based on type (nouns, verb,etc)
- stories to plug the words into
    - expandable template for stories

### 208: Introducing Arrays 
*(19.08.2018)*

- node Convention is CamelCase
- string escaping with "%s" : for strings.
`print(story % prompt)`

### 209: RichTextLabel 
*(19.08.2018)*

- every scene has one "root" node (only access via code)
- in the scene editor you can only see the oldest parent node
- TextureRect node is for showing images
- project settings -> Display - Window to resize player camera size

- `get_node(Blackboard/StoryText)`  = `$Blackboard/StoryText` 
- RichTextLabel´s input can be controlled via `.text` and `bbcode_text` (*bbcode_text* can be bold, italic, etc..)

### 210: LineEdit

- Node: TextEdit is good for user input with multiple lines
- Node: LineEdit : single line text editing
- Instead of creating small scripts for each subnode, we acn use **signals**
- Signals can be created inside the script or from the *node inspector* (bottom right). select *text_entered* and click *connect* 
- TextureButton
- you can lock nodes to not move children nodes without purpose.

Created two signals in script:
- `func _on_TextureButton_pressed():`
- `func _on_TextBox_text_entered(new_text):`
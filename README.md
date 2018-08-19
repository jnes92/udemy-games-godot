# Table of contents:
<!-- @import "[TOC]" {cmd="toc" depthFrom=1 depthTo=6 orderedList=false} -->

<!-- code_chunk_output -->

- [Table of contents:](#table-of-contents)
- [Overview](#overview)
- [Learning Log](#learning-log)
	- [Section 1](#section-1)
		- [103: Installing GoDot](#103-installing-godot)
		- [105: Hello GoDot.](#105-hello-godot)
	- [Section 2: Loony Lips](#section-2-loony-lips)
		- [207: Game Requirements](#207-game-requirements)
		- [208: Introducing Arrays](#208-introducing-arrays)
		- [209: RichTextLabel](#209-richtextlabel)
		- [210: LineEdit](#210-lineedit)
		- [211: Using Player´s Input](#211-using-player%C2%B4s-input)
		- [212: queue_free and reload_current_scene](#212-queuefree-and-reloadcurrentscene)
		- [213: Dictionaries for Story Templates](#213-dictionaries-for-story-templates)
		- [214: JSON and File](#214-json-and-file)
		- [215: Using Git with GoDot](#215-using-git-with-godot)
		- [216: Visual Studio Code](#216-visual-studio-code)
		- [217: Godot Mono for C](#217-godot-mono-for-c)
		- [218: Finding Nodes with C#](#218-finding-nodes-with-c)
		- [219: Wiring Signals with C](#219-wiring-signals-with-c)

<!-- /code_chunk_output -->

# Overview

Kurs gestartet am 19.08.2018

* [x] Section 1: 19.08.2018
* [ ] Section 2: 19.08.2018
	- [x] Lektion 7
	- [x] Lektion 8
	- [x] Lektion 9
	- [x] Lektion 10
	- [x] Lektion 11 
	- [x] Lektion 12
	- [x] Lektion 13
	- [x] Lektion 14 
	- [x] Lektion 15
	- [x] Lektion 16
	- [x] Lektion 17
	- [x] Lektion 18
	- [x] Lektion 19
	- [ ] Lektion 20
    - [ ] Lektion 21
	- [ ] Lektion 22

# Learning Log
## Section 1 
### 103: Installing GoDot 


Verfügbar für:
- Windows
- Mac
- Linux

Installation auch über Steam möglich

Versionen:
- Python Script
- C# Support with Mono.

### 105: Hello GoDot. 

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

a word game
- ask for a word based on type (nouns, verb,etc)
- stories to plug the words into
    - expandable template for stories

### 208: Introducing Arrays 

- node Convention is CamelCase
- string escaping with "%s" : for strings.
`print(story % prompt)`

### 209: RichTextLabel 

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

### 211: Using Player´s Input

- if statements in python
- `if thing > 0 : ` `elif anothercondition` `else dothis`  


### 212: queue_free and reload_current_scene

- `queue_free` removes nodes and set them free 
- `get_tree` gets complete tree instead of nodes

### 213: Dictionaries for Story Templates

- `randomize()` will create a random seed
- `randi()` will create a random number (integer)
- needs to be between 0 and array length -> 

### 214: JSON and File

- seperates object to *key* and *value*
- To read a file and convert it to json
	- `var file = File.new()`
	- `file.open(filename, File.READ)`
	- `var text = file.get_as_text()`
	- `var data = parse_json(text)`
	- `file.close()` - remember to close filestreams to prevent memory leaks.
	- `return data`
- very nice for localization.

### 215: Using Git with GoDot
### 216: Visual Studio Code

* Install Extensions
  * GoDot Tools
  * C#

* Project Settings - Editor Settings
  * Activate External Editor
  * Set your "Exec Flags" as follows...
	`{project} --goto {file}:{line}:{col}` 

### 217: Godot Mono for C#

* Current Mono 3.0.6 needs Mono SDK 5.12.0

### 218: Finding Nodes with C# 

* Find Nodes: `textBox = FindNode("TextBox") as LineEdit`
  * returns node, so cast it to specific node.
  * parameter: Node name (string)

### 219: Wiring Signals with C#

* Disconnect old signal and click reconnect
* create functions is not working currently with c#, so copy name
* signal functions are not public or private... :D
* *cached reference* for storing nodes in c#
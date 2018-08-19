using Godot;
using System;

public class LoonyLips : Node2D
{
    // Member variables here, example:
    // private int a = 2;
    // private string b = "textvar";

    public override void _Ready()
    {
       var storyText = FindNode("StoryText") as RichTextLabel;
       storyText.Text = "It worked...";

       var textEntryBox = FindNode("TextBox") as LineEdit;
       textEntryBox.Text = "Changed Input Text";
    }

//    public override void _Process(float delta)
//    {
//        // Called every frame. Delta is time since last frame.
//        // Update game logic here.
//        
//    }
}

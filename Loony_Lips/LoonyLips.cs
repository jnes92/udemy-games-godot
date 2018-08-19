using Godot;
using System;

public class LoonyLips : Node2D
{
    RichTextLabel storyText;
    LineEdit textEntryBox;

    public override void _Ready()
    {
        CachingComponents();
        ShowIntro();
        //SetRandomStory();
        // PromptPlayer();
    }

    // Start of Signals
    void OnTextEntry(String newText)
    {
        GD.Print("Text entered " + newText);
    }

    void OnButtonClick()
    {
        GD.Print("OK");
    }
    // End of Signals

    private void CachingComponents()
    {
       storyText = FindNode("StoryText") as RichTextLabel;
       textEntryBox = FindNode("TextBox") as LineEdit;
    }

    private void ShowIntro()
    {
       storyText.Text = "It worked...";
       textEntryBox.Text = "Changed Input Text";
    }
}

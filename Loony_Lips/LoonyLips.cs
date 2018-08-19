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

        GetJSONParseResult("stories.json"); // TODO: Remove.

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

    private JSONParseResult GetJSONParseResult(string localFileName)
    {
        var file = new File();
        file.Open(localFileName, 1); // Mode 1 : Read
        var text = file.GetAsText();
        file.Close();

        var parseResult = JSON.Parse(text);

        if(parseResult.Error != 0)
        {
            GD.Print(localFileName + " parse error");
            return null;
        }
        else {
            GD.Print(localFileName + " read OK");
            return parseResult;
        }
    }
}

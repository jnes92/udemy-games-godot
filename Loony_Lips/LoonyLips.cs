using Godot;
using System;
using System.Collection.Generic;

struct Story 
{
    public List<String> prompts;
    public String story;
}

public class LoonyLips : Node2D
{
    // private instance variable for state
    Story currentStory;

    RichTextLabel storyText;
    LineEdit textEntryBox;

    public override void _Ready()
    {
        CachingComponents();
        ShowIntro();
        SetRandomStory();
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

    private void SetRandomStory()
    {
        var parseResult = GetJSONParseResult("stories.json");
        var stories = parseResult.Result as Array;

        Random rnd = new Random();
        var storyIndex = rnd.Next(0, stories.length);
        var randomStory = stories.GetValue(storyIndex) as Dictionary<System.Object, System.Objet>;
        
        // TODO : currentStory.prompts = GetPrompts(randomStory)
        currentStory.story = randomStory["story"] as string; 
        GD.Print(currentStory.story);
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

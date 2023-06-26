using UnityEngine;

public abstract class ConversationNode : ScriptableObject
{
}

[System.Serializable]
public class DecisionNode
{
    [SerializeField] private DialogueNode dialogue;
    [SerializeField][Range(0, 1)] private float conservationValue;

    public DialogueNode Dialogue { get { return dialogue; } }
    public float ConservationValue { get { return conservationValue; } }
}

[System.Serializable]
public class DialogueNode
{
    [SerializeField] private string speaker;
    [SerializeField] [TextArea] private string subtitle;
    [SerializeField] [TextArea] private string responseCaption;
    [SerializeField] private float duration; //if duration is 0 or less, wait for player response
    [SerializeField] private AudioClip audio;

    public string Speaker { get { return speaker; } }
    public string Subtitle { get { return subtitle; } }
    public string ResponseCaption { get { return responseCaption; } }
    public float Duration { get { return duration; } }
    public AudioClip Audio { get { return audio; } }
}
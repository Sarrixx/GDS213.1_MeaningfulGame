using UnityEngine;

public abstract class ConversationNode : ScriptableObject
{
}

[System.Serializable]
public class DecisionNode
{
    public enum ValueComparitor { equalTo = 0, greaterThan = 1, greaterThanOrEqual = 2, lessThan = 3, lessThanOrEqual = 4 }

    [SerializeField] private DialogueNode dialogue;
    [SerializeField][Range(-1, 1)] private float value;
    [SerializeField] private ValueComparitor valueComparitor;

    public DialogueNode Dialogue { get { return dialogue; } }
    public float Value { get { return value; } }
    public ValueComparitor Comparitor { get { return valueComparitor; } }
}

[System.Serializable]
public class DialogueNode
{
    [SerializeField] private string speaker;
    [SerializeField] [TextArea] private string subtitle;
    [SerializeField] private float duration;
    [SerializeField] private AudioClip audio;

    public string Speaker { get { return speaker; } }
    public string Subtitle { get { return subtitle; } }
    public float Duration { get { return duration; } }
    public AudioClip Audio { get { return audio; } }
}

[System.Serializable]
public class DialogueResponseNode : DialogueNode
{
    [SerializeField] [TextArea] private string responseCaption;
    [SerializeField] [Range(-1, 1)] private float valueModifier = 0;

    public string ResponseCaption { get { return responseCaption; } }
    public  float ValueModifier { get { return valueModifier; } }
}
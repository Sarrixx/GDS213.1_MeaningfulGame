using UnityEngine;
public abstract class ConversationNode : ScriptableObject
{
}

[System.Serializable]
public class ConversationData
{
    [SerializeField] private ConversationNode[] conversation;
    [SerializeField] private float delay;
    [SerializeField] private ConversationTrigger[] nextTriggers;

    public ConversationNode[] Conversation { get { return conversation; } }
    public float Delay { get { return delay; } }
    public ConversationTrigger[] NextTriggers { get { return nextTriggers; } }

    public void ActivateNextTriggers()
    {
        if (nextTriggers.Length > 0)
        {
            foreach (ConversationTrigger trigger in nextTriggers)
            {
                if(trigger.TrackConversation() == true)
                {
                    trigger.gameObject.SetActive(true);
                }
            }
        }
    }

    public void DisableNextTriggers()
    {
        if (nextTriggers.Length > 0)
        {
            foreach (ConversationTrigger trigger in nextTriggers)
            {
                Debug.Log($"Attempting to disable trigger {trigger.name}");
                trigger.gameObject.SetActive(false);
            }
        }
    }
}

[System.Serializable]
public class DecisionNode
{
    public enum ValueComparitor { greaterThan = 0, lessThan = 1 }

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
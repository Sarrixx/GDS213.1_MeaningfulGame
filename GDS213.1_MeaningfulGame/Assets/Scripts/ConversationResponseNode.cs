using UnityEngine;

[CreateAssetMenu(fileName = "New Response Node", menuName = "Conversation Nodes/Response Node")]
public class ConversationResponseNode : ConversationNode
{
    [SerializeField] private DecisionNode[] characterPrompts;
    [SerializeField] private DecisionNode[] playerResponses;

    public DecisionNode[] CharacterPrompts { get { return characterPrompts; } }
    public DecisionNode[] PlayerResponses { get { return playerResponses; } }
}
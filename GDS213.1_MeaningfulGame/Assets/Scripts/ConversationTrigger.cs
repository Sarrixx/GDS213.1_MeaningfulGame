using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ConversationTrigger : MonoBehaviour
{
    [SerializeField] private ConversationNode[] conversation;

    public ConversationNode[] Conversation { get { return conversation; } }
}

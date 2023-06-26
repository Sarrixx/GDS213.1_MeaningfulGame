using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UIElements;

public class DialogueManager : MonoBehaviour
{
    public delegate void DialogueNodeDelegate(DialogueNode node);
    public delegate void ResponseNodeDelegate(ConversationResponseNode node, DecisionNode characterPrompt);

    private int conversationNodeIndex = -1;
    private int selectedDialogueIndex = -1;
    private AudioSource aSrc;

    public int SelectedDialogueIndex
    {
        get { return selectedDialogueIndex; }
        set
        {
            if(CurrentConversation != null && value < CurrentConversation.Length)
            {
                selectedDialogueIndex = value;
            }
        }
    }
    public ConversationNode[] CurrentConversation { get; private set; }

    public event DialogueNodeDelegate InvokeDialogueNode;
    public event ResponseNodeDelegate InvokeResponseNode;

    public static DialogueManager Instance { get; private set; }

    private void Awake()
    {
        if(Instance == null)
        {
            Instance = this;
            TryGetComponent(out aSrc);
        }
    }

    // Start is called before the first frame update
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        
    }

    public bool InitiateConversation(ConversationNode[] conversation)
    {
        if (CurrentConversation == null && conversationNodeIndex <= 0 && conversation.Length > 0)
        {
            conversationNodeIndex = 0;
            CurrentConversation = conversation;
            StartCoroutine(InvokeDialogue());
            return true;
        }
        return false;
    }

    private IEnumerator InvokeDialogue()
    {
        ConversationNode node = CurrentConversation[conversationNodeIndex];
        float duration = 0f;
        if (node is ConversationDialogueNode dialogueNode)
        {
            aSrc.clip = dialogueNode.Dialogue.Audio;
            duration = dialogueNode.Dialogue.Duration;
            InvokeDialogueNode?.Invoke(dialogueNode.Dialogue);
            yield return new WaitForSeconds(duration);
            //go to next conversation node
            EndDialogue();
        }
        else if (node is ConversationResponseNode responseNode)
        {
            DecisionNode characterPrompt = null;
            foreach (DecisionNode prompt in responseNode.CharacterPrompts)
            {
                if (characterPrompt == null || prompt.ConservationValue < characterPrompt.ConservationValue)
                {
                    characterPrompt = prompt;
                }
            }
            aSrc.clip = characterPrompt.Dialogue.Audio;
            duration = characterPrompt.Dialogue.Duration;
            InvokeDialogueNode?.Invoke(characterPrompt.Dialogue);
            yield return new WaitForSeconds(duration);
            InvokeResponseNode?.Invoke(responseNode, characterPrompt);
            while(selectedDialogueIndex < 0)
            {
                yield return new WaitForEndOfFrame();
            }
            EndDialogue();
        }
    }

    private void EndDialogue()
    {
        conversationNodeIndex++;
        if(conversationNodeIndex < CurrentConversation.Length)
        {
            StartCoroutine(InvokeDialogue());
        }
        else
        {
            CurrentConversation = null;
            selectedDialogueIndex = -1;
            conversationNodeIndex = -1;
            InvokeDialogueNode.Invoke(null);
        }
    }
}
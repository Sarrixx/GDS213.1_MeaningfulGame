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
    public Dictionary<string, object> BlackBoard { get; private set; } = new Dictionary<string, object>()
    {
        { "conservationValue", 0f }
    };

    public event DialogueNodeDelegate OnInvokeDialogueNode;
    public event ResponseNodeDelegate InvokeResponseNode;

    public static DialogueManager Instance { get; private set; }

    private void Awake()
    {
        if(Instance == null)
        {
            Instance = this;
            if(TryGetComponent(out aSrc) == true)
            {
                aSrc.loop = false;
            }
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
            if(CurrentConversation[conversationNodeIndex] is ConversationDialogueNode dialogueNode)
            {
                StartCoroutine(InvokeDialogueNode(dialogueNode.Dialogue));
            }
            else if(CurrentConversation[conversationNodeIndex] is ConversationDecisionNode decisionNode)
            {
                StartCoroutine(InvokeDecisionNode(decisionNode.Decisions));
            }
            else if(CurrentConversation[conversationNodeIndex] is ConversationResponseNode responseNode)
            {
                StartCoroutine(InvokeConversationNode(responseNode));
            }
            return true;
        }
        return false;
    }

    private IEnumerator InvokeDialogueNode(DialogueNode dialogueNode)
    {
        aSrc.clip = dialogueNode.Audio;
        OnInvokeDialogueNode?.Invoke(dialogueNode);
        aSrc.Play();
        yield return new WaitForSeconds(dialogueNode.Duration < dialogueNode.Audio.length ? dialogueNode.Audio.length : dialogueNode.Duration);
        EndDialogue();
    }

    private IEnumerator InvokeDecisionNode(DecisionNode[] decisions)
    {
        DecisionNode characterPrompt = null;
        foreach (DecisionNode prompt in decisions)
        {
            if (characterPrompt == null || prompt.Value < characterPrompt.Value)
            {
                characterPrompt = prompt;
            }
        }
        aSrc.clip = characterPrompt.Dialogue.Audio;
        OnInvokeDialogueNode?.Invoke(characterPrompt.Dialogue);
        aSrc.Play();
        yield return new WaitForSeconds(characterPrompt.Dialogue.Duration < characterPrompt.Dialogue.Audio.length ? characterPrompt.Dialogue.Audio.length : characterPrompt.Dialogue.Duration);
        EndDialogue();
    }

    private IEnumerator InvokeConversationNode(ConversationResponseNode node)
    {
        DecisionNode characterPrompt = null;
        foreach (DecisionNode prompt in node.CharacterPrompts)
        {
            if (characterPrompt == null || prompt.Value < characterPrompt.Value)
            {
                characterPrompt = prompt;
            }
        }
        aSrc.clip = characterPrompt.Dialogue.Audio;
        OnInvokeDialogueNode?.Invoke(characterPrompt.Dialogue);
        aSrc.Play();
        yield return new WaitForSeconds(characterPrompt.Dialogue.Duration < characterPrompt.Dialogue.Audio.length ? characterPrompt.Dialogue.Audio.length : characterPrompt.Dialogue.Duration);
        InvokeResponseNode?.Invoke(node, characterPrompt);
        while (selectedDialogueIndex < 0)
        {
            yield return new WaitForEndOfFrame();
        }
        EndDialogue();
    }

    private void EndDialogue()
    {
        if (selectedDialogueIndex >= 0 && CurrentConversation[conversationNodeIndex] is ConversationResponseNode responseNode)
        {
            StartCoroutine(InvokeDialogueNode(responseNode.PlayerResponses[selectedDialogueIndex]));
            selectedDialogueIndex = -1;
        }
        else
        {
            conversationNodeIndex++;
            if (conversationNodeIndex < CurrentConversation.Length)
            {
                if (CurrentConversation[conversationNodeIndex] is ConversationDialogueNode dialogueNode)
                {
                    StartCoroutine(InvokeDialogueNode(dialogueNode.Dialogue));
                }
                else if (CurrentConversation[conversationNodeIndex] is ConversationDecisionNode decisionNode)
                {
                    StartCoroutine(InvokeDecisionNode(decisionNode.Decisions));
                }
                else if (CurrentConversation[conversationNodeIndex] is ConversationResponseNode response)
                {
                    StartCoroutine(InvokeConversationNode(response));
                }
            }
            else
            {
                CurrentConversation = null;
                selectedDialogueIndex = -1;
                conversationNodeIndex = -1;
                OnInvokeDialogueNode.Invoke(null);
            }
        }
    }
}
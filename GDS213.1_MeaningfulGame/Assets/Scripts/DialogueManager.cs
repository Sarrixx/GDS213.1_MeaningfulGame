using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UIElements;

public class DialogueManager : MonoBehaviour
{
    public delegate void DialogueNodeDelegate(DialogueNode node);
    public delegate void ResponseNodeDelegate(ConversationResponseNode node, DecisionNode characterPrompt);

    [SerializeField] private bool skipAutomaticConversations = true;
    [SerializeField] private ConversationNode[] dayStartConversation;
    [SerializeField] private float dayStartDelay;
    [SerializeField] private ConversationNode[] dayEndConversation;
    [SerializeField] private float dayEndDelay;

    private int conversationNodeIndex = -1;
    private int selectedDialogueIndex = -1;
    private AudioSource aSrc;

    public int SelectedDialogueIndex
    {
        get { return selectedDialogueIndex; }
        set
        {
            if(CurrentConversation != null)
            {
                selectedDialogueIndex = value;
            }
        }
    }
    public ConversationNode[] CurrentConversation { get; private set; }
    public Dictionary<string, object> BlackBoard { get; private set; } = new Dictionary<string, object>()
    {
        { "openness", 0f }
    };

    public event DialogueNodeDelegate OnInvokeDialogueNode;
    public event ResponseNodeDelegate OnInvokeResponseNode;

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

    private void OnDestroy()
    {
        if(Instance == this)
        {
            Instance = null;
        }
    }

    private void Start()
    {
        if(dayStartConversation.Length > 0 && skipAutomaticConversations == false)
        {
            StartCoroutine(InitiateConversationWithDelay(dayStartConversation, dayStartDelay));
        }
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
                StartCoroutine(InvokeResponseNode(responseNode));
            }
            return true;
        }
        return false;
    }

    public IEnumerator InitiateConversationWithDelay(ConversationNode[] conversation, float delay)
    {
        if (CurrentConversation == null && conversationNodeIndex <= 0 && conversation.Length > 0)
        {
            conversationNodeIndex = 0;
            CurrentConversation = conversation;
            yield return new WaitForSeconds(delay);
            if (CurrentConversation[conversationNodeIndex] is ConversationDialogueNode dialogueNode)
            {
                StartCoroutine(InvokeDialogueNode(dialogueNode.Dialogue));
            }
            else if (CurrentConversation[conversationNodeIndex] is ConversationDecisionNode decisionNode)
            {
                StartCoroutine(InvokeDecisionNode(decisionNode.Decisions));
            }
            else if (CurrentConversation[conversationNodeIndex] is ConversationResponseNode responseNode)
            {
                StartCoroutine(InvokeResponseNode(responseNode));
            }
        }
    }

    private IEnumerator InvokeDialogueNode(DialogueNode dialogueNode)
    {
        aSrc.clip = dialogueNode.Audio;
        OnInvokeDialogueNode?.Invoke(dialogueNode);
        aSrc.Play();
        yield return new WaitForSeconds(dialogueNode.Audio != null && dialogueNode.Duration < dialogueNode.Audio.length ? dialogueNode.Audio.length : dialogueNode.Duration);
        EndDialogue();
    }

    private IEnumerator InvokeDecisionNode(DecisionNode[] decisions)
    {
        DecisionNode selectedPrompt = null;
        foreach (DecisionNode prompt in decisions)
        {
            if (selectedPrompt == null)
            {
                selectedPrompt = prompt;
            }
            else //this algorithm needs to be revised to check the current value against the selected Prompt value too
            {
                if (prompt.Comparitor == DecisionNode.ValueComparitor.lessThan)
                {
                    if ((float)BlackBoard["openness"] <= prompt.Value && prompt.Value < selectedPrompt.Value)
                    {
                        selectedPrompt = prompt;
                    }
                }
                else if (prompt.Comparitor == DecisionNode.ValueComparitor.greaterThan)
                {
                    if ((float)BlackBoard["openness"] >= prompt.Value && prompt.Value > selectedPrompt.Value)
                    {
                        selectedPrompt = prompt;
                    }
                }
            }
        }
        aSrc.clip = selectedPrompt.Dialogue.Audio;
        OnInvokeDialogueNode?.Invoke(selectedPrompt.Dialogue);
        aSrc.Play();
        yield return new WaitForSeconds(selectedPrompt.Dialogue.Audio && selectedPrompt.Dialogue.Duration < selectedPrompt.Dialogue.Audio.length ? selectedPrompt.Dialogue.Audio.length : selectedPrompt.Dialogue.Duration);
        EndDialogue();
    }

    private IEnumerator InvokeResponseNode(ConversationResponseNode node)
    {
        DecisionNode selectedPrompt = null;
        foreach (DecisionNode prompt in node.CharacterPrompts)
        {
            if (selectedPrompt == null)
            {
                selectedPrompt = prompt;
            }
            else //this algorithm needs to be revised to check the current value against the selected Prompt value too
            {
                if (prompt.Comparitor == DecisionNode.ValueComparitor.lessThan)
                {
                    if ((float)BlackBoard["openness"] <= prompt.Value && prompt.Value < selectedPrompt.Value)
                    {
                        selectedPrompt = prompt;
                    }
                }
                else if (prompt.Comparitor == DecisionNode.ValueComparitor.greaterThan)
                {
                    if ((float)BlackBoard["openness"] >= prompt.Value && prompt.Value > selectedPrompt.Value)
                    {
                        selectedPrompt = prompt;
                    }
                }
            }
        }
        aSrc.clip = selectedPrompt.Dialogue.Audio;
        OnInvokeDialogueNode?.Invoke(selectedPrompt.Dialogue);
        aSrc.Play();
        yield return new WaitForSeconds(selectedPrompt.Dialogue.Audio != null && selectedPrompt.Dialogue.Duration < selectedPrompt.Dialogue.Audio.length ? selectedPrompt.Dialogue.Audio.length : selectedPrompt.Dialogue.Duration);
        OnInvokeResponseNode?.Invoke(node, selectedPrompt);
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
            float openness = (float)BlackBoard["openness"];
            float ratio = responseNode.PlayerResponses[selectedDialogueIndex].ValueModifier / 1;
            Debug.Log("Ratio: " + ratio);
            if (responseNode.PlayerResponses[selectedDialogueIndex].ValueModifier != 0)
            {
                openness += 0.2f * ratio;
                openness = Mathf.Clamp(openness, -1, 1);
                Debug.Log("Openness: " + openness);
                BlackBoard["openness"] = openness;
            }
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
                    StartCoroutine(InvokeResponseNode(response));
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
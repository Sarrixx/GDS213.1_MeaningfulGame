using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

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
    private int totalConversations = 0;
    private AudioSource aSrc;

    public int SelectedDialogueIndex
    {
        get { return selectedDialogueIndex; }
        set
        {
            if (CurrentConversation != null)
            {
                selectedDialogueIndex = value;
            }
        }
    }
    public int ConversationCount { get; private set; } = 0;
    public int TotalConversations { get { return totalConversations; } set { totalConversations = value; } }
    public ConversationNode[] CurrentConversation { get; private set; }
    public static Dictionary<string, object> BlackBoard { get; private set; } = new Dictionary<string, object>()
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
                TotalConversations = FindObjectsOfType<ConversationTrigger>().Length;
                CameraConsole console = FindObjectOfType<CameraConsole>();
                if (console != null && console.InteractionConversation != null && console.InteractionConversation.Length > 0) { TotalConversations++; }
                if(skipAutomaticConversations == false)
                {
                    if(dayStartConversation.Length > 0)
                    {
                        TotalConversations++;
                    }
                    if(dayEndConversation.Length > 0)
                    {
                        TotalConversations++;
                    }
                }
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
    }

    public void TriggerDayStart()
    {
        if (dayStartConversation.Length > 0 && skipAutomaticConversations == false)
        {
            StartCoroutine(InitiateConversationWithDelay(dayStartConversation, dayStartDelay, false));
        }
    }

    public bool InitiateConversation(ConversationNode[] conversation, float delay = 0, bool setConversationPostDelay = false)
    {
        if (CurrentConversation == null && conversationNodeIndex <= 0 && conversation.Length > 0)
        {
            StartCoroutine(InitiateConversationWithDelay(conversation, delay, setConversationPostDelay));
            //conversationNodeIndex = 0;
            //CurrentConversation = conversation;
            //if(CurrentConversation[conversationNodeIndex] is ConversationDialogueNode dialogueNode)
            //{
            //    StartCoroutine(InvokeDialogueNode(dialogueNode.Dialogue));
            //}
            //else if(CurrentConversation[conversationNodeIndex] is ConversationDecisionNode decisionNode)
            //{
            //    StartCoroutine(InvokeDecisionNode(decisionNode.Decisions));
            //}
            //else if(CurrentConversation[conversationNodeIndex] is ConversationResponseNode responseNode)
            //{
            //    StartCoroutine(InvokeResponseNode(responseNode));
            //}
            return true;
        }
        return false;
    }

    private IEnumerator InitiateConversationWithDelay(ConversationNode[] conversation, float delay, bool setConversationPostDelay)
    {
        if (CurrentConversation == null && conversationNodeIndex <= 0 && conversation.Length > 0)
        {
            if (setConversationPostDelay == false)
            {
                conversationNodeIndex = 0;
                CurrentConversation = conversation;
                yield return new WaitForSeconds(delay);
            }
            else
            {
                yield return new WaitForSeconds(delay);
                conversationNodeIndex = 0;
                CurrentConversation = conversation;
            }
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
        float openness = (float)BlackBoard["openness"];
        foreach (DecisionNode prompt in decisions)
        {
            if (selectedPrompt == null) //this section is broken
            {
                selectedPrompt = prompt;
            }
            else if (prompt.Comparitor == DecisionNode.ValueComparitor.greaterThan)
            {
                if (openness >= prompt.Value && selectedPrompt.Value < prompt.Value)
                {
                    selectedPrompt = prompt;
                }
            }
            else if (prompt.Comparitor == DecisionNode.ValueComparitor.lessThan)
            {
                if (openness <= prompt.Value && selectedPrompt.Value > prompt.Value)
                {
                    selectedPrompt = prompt;
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
        float openness = (float)BlackBoard["openness"];
        foreach (DecisionNode prompt in node.CharacterPrompts)
        {
            if (selectedPrompt == null) //this section is broken
            {
                selectedPrompt = prompt;
            }
            else if (prompt.Comparitor == DecisionNode.ValueComparitor.greaterThan)
            {
                if (openness >= prompt.Value && selectedPrompt.Value < prompt.Value)
                {
                    selectedPrompt = prompt;
                }
            }
            else if (prompt.Comparitor == DecisionNode.ValueComparitor.lessThan)
            {
                if (openness <= prompt.Value && selectedPrompt.Value > prompt.Value)
                {
                    selectedPrompt = prompt;
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
                ConversationCount++;
                if (ConversationCount >= TotalConversations)
                {
                    if(DayManager.Instance.TriggerNextDay() == 0)
                    {
                        BlackBoard["openness"] = 0f;
                        Debug.Log("GAME FINISHED");
                    }
                    else
                    {
                        Debug.Log("LOAD NEXT SCENE");
                    }
                }
                else if (dayEndConversation.Length > 0 && ConversationCount == TotalConversations - 1 && skipAutomaticConversations == false)
                {
                    StartCoroutine(InitiateConversationWithDelay(dayEndConversation, dayEndDelay, true));
                }
            }
        }
    }
}
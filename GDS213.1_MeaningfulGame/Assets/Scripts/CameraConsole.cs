using UnityEngine;

public class CameraConsole : Interactable
{
    [SerializeField] private CameraFeed[] cameras;
    [SerializeField] private ConversationNode[] interactionConversation;
    [SerializeField] private float transitionTime = 1;

    private int currentFeedIndex = 0;
    private float transitionTimer = -1;
    private bool consoleEngaged = false;

    public ConversationNode[] InteractionConversation { get { return interactionConversation; } }

    protected override void Awake()
    {
        base.Awake();
    }

    private void Update()
    {
        if(consoleEngaged == true && transitionTimer < 0)
        {
            if (cameras[currentFeedIndex].Zoomed == false && DialogueManager.Instance.CurrentConversation == null)
            {
                if (Input.mouseScrollDelta.y > 0)
                {
                    cameras[currentFeedIndex].Deactivate();
                    currentFeedIndex++;
                    if (currentFeedIndex >= cameras.Length)
                    {
                        currentFeedIndex = 0;
                    }
                    cameras[currentFeedIndex].Activate();
                    transitionTimer = 0;
                }
                else if (Input.mouseScrollDelta.y < 0)
                {
                    cameras[currentFeedIndex].Deactivate();
                    currentFeedIndex--;
                    if (currentFeedIndex < 0)
                    {
                        currentFeedIndex = cameras.Length - 1;
                    }
                    cameras[currentFeedIndex].Activate();
                    transitionTimer = 0;
                }
            }
        }

        if(transitionTimer >= 0 )
        {
            transitionTimer += Time.deltaTime;
            if(transitionTimer > transitionTime)
            {
                transitionTimer = -1;
            }
        }
    }

    public override bool OnInteract(InteractionHitInfo interactionInfo)
    {
        if (consoleEngaged == false)
        {
            consoleEngaged = true;
            cameras[currentFeedIndex].Activate();
            if(interactionConversation != null)
            {
                DialogueManager.Instance.InitiateConversation(interactionConversation, 0.25f, false);
                interactionConversation = null;
            }
            return true;
        }
        else
        {
            consoleEngaged = false;
            cameras[currentFeedIndex].Deactivate();
            return false;
        }
    }
}

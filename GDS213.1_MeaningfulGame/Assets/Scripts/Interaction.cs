using UnityEngine;
using static UnityEngine.GraphicsBuffer;

public class Interaction : MonoBehaviour
{
    public delegate void InteractionDelegate(GameObject gameObject);

    [Tooltip("Toggle on to print console messages from this component.")]
    [SerializeField] private bool debug;
    [Tooltip("The distance that the player can reach interactions.")]
    [SerializeField] private float distance = 3f;
    [Tooltip("The layers to query for interactions.")]
    [SerializeField] private LayerMask interactionLayers;

    private Transform currentInteraction;

    public static event InteractionDelegate OnInteractionDetected;

    private void Update()
    {
        if (DialogueManager.Instance.CurrentConversation == null)
        {
            if (Physics.Raycast(transform.position, transform.forward, out RaycastHit hitInfo, distance, interactionLayers) == true)
            {
                Debug.DrawRay(transform.position, transform.forward * distance, Color.green, 0.2f);
                if (currentInteraction != hitInfo.transform)
                {
                    OnInteractionDetected?.Invoke(hitInfo.transform.gameObject);
                    currentInteraction = hitInfo.transform;
                }
                if (Input.GetButtonDown("Use") == true)
                {
                    if (hitInfo.transform.TryGetComponent(out IInteractable target) == true)
                    {
                        if (target.OnInteract(new InteractionHitInfo(hitInfo.transform.gameObject)) == true)
                        {
                            Log($"Interacted with {currentInteraction.name}.");
                        }
                    }
                }
            }
            else if (currentInteraction != null)
            {
                OnInteractionDetected?.Invoke(null);
                currentInteraction = null;
            }
        }
    }

    private void Log(string message)
    {
        if (debug == true)
        {
            Debug.Log("[PLAYER INTERACTION] " + message);
        }
    }
}

public interface IInteractable
{
    bool OnInteract(InteractionHitInfo interactionData);
}

public struct InteractionHitInfo
{
    public GameObject TargetObject { get; private set; }

    public InteractionHitInfo(GameObject obj)
    {
        TargetObject = obj;
    }
}
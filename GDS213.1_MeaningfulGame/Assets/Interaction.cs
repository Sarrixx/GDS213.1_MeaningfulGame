using UnityEngine;

public class Interaction : MonoBehaviour
{
    [Tooltip("Toggle on to print console messages from this component.")]
    [SerializeField] private bool debug;
    [Tooltip("The distance that the player can reach interactions.")]
    [SerializeField] private float distance = 3f;
    [Tooltip("The layers to query for interactions.")]
    [SerializeField] private LayerMask interactionLayers;

    private void Update()
    {
        if (Physics.Raycast(transform.position, transform.forward, out RaycastHit hitInfo, distance, interactionLayers) == true)
        {
            Debug.DrawRay(transform.position, transform.forward * distance, Color.green, 0.2f);
            if (Input.GetButtonDown("Use") == true)
            {
                if (hitInfo.transform.TryGetComponent(out IInteractable target) == true)
                {
                    if (target.OnInteract(new InteractionHitInfo()) == true)
                    {
                    }
                }
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
}
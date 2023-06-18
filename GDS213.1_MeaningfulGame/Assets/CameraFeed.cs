using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CameraFeed : MonoBehaviour
{
    public delegate bool CameraFeedToggleDelegate(bool toggle);

    [SerializeField] private float speed;
    [SerializeField] private float interactionDistance;
    [SerializeField] private float clampBounds;
    [SerializeField] private LayerMask interactionMask;

    private float originalRot;
    private float currentOffset;

    public static event CameraFeedToggleDelegate FeedToggledEvent;

    private void Awake()
    {
        gameObject.SetActive(false);
    }

    // Start is called before the first frame update
    void Start()
    {
        originalRot = transform.localEulerAngles.y;
    }

    // Update is called once per frame
    void Update()
    {
        float horizontalInput = Input.GetAxisRaw("Horizontal");
        float rotationStep = horizontalInput * speed * Time.deltaTime;
        currentOffset += rotationStep;
        currentOffset = Mathf.Clamp(currentOffset, -clampBounds, clampBounds);
        transform.localRotation = Quaternion.Euler(transform.localEulerAngles.x, originalRot + currentOffset, transform.localEulerAngles.z);

        if (Physics.Raycast(transform.position, transform.forward, out RaycastHit hit, interactionDistance, interactionMask, QueryTriggerInteraction.Ignore) == true)
        {
            Debug.DrawRay(transform.position, transform.forward * interactionDistance, Color.green);
        }
        else
        {
            Debug.DrawRay(transform.position, transform.forward * interactionDistance, Color.red);
        }
    }

    public bool Activate()
    {
        if(FeedToggledEvent.Invoke(true) == true)
        {
            gameObject.SetActive(true);
            return true;
        }
        return false;
    }

    public bool Deactivate()
    {
        if (FeedToggledEvent.Invoke(false) == true)
        {
            gameObject.SetActive(false);
            return true;
        }
        return false;
    }
}

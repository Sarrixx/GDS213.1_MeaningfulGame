using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class CameraFeed : MonoBehaviour
{
    public delegate bool CameraFeedToggleDelegate(bool toggle);

    [SerializeField] private float speed;
    [SerializeField] private float interactionDistance;
    [SerializeField] private float clampBounds;
    [SerializeField] private LayerMask interactionMask;
    [SerializeField] private Text camFeedText;
    [SerializeField] private AudioClip moveAudio;
    [SerializeField] private AudioClip endMovingAudio;

    private Vector3 originalRot;
    private float currentYOffset;
    private float currentXOffset;
    private AudioSource aSrc;
    private ZoomController zoom;

    public bool Zoomed { get { return zoom.Zoomed; } }

    public static event CameraFeedToggleDelegate FeedToggledEvent;

    private void Awake()
    {
        TryGetComponent(out aSrc);
        TryGetComponent(out zoom);
        gameObject.SetActive(false);
        camFeedText.transform.root.gameObject.SetActive(false);
    }

    // Start is called before the first frame update
    void Start()
    {
        originalRot = transform.localEulerAngles;
    }

    // Update is called once per frame
    void Update()
    {
        float horizontalInput = Input.GetAxisRaw("Horizontal");
        float verticalInput = Input.GetAxisRaw("Vertical");
        float yRotationStep = horizontalInput * speed * Time.deltaTime;
        float xRotationStep = verticalInput * speed * Time.deltaTime;
        currentYOffset += yRotationStep;
        currentXOffset += xRotationStep;
        if((horizontalInput != 0 && currentYOffset > -clampBounds && currentYOffset < clampBounds) || (verticalInput != 0 && currentXOffset > -clampBounds && currentXOffset < clampBounds))
        {
            if(aSrc.clip != moveAudio)
            {
                aSrc.clip = moveAudio;
                aSrc.loop = true;
                aSrc.Play();
            }
        }
        else if(aSrc.clip == moveAudio)
        {
            aSrc.Stop();
            aSrc.clip = null;
            aSrc.loop = false;
            aSrc.PlayOneShot(endMovingAudio);
        }
        currentYOffset = Mathf.Clamp(currentYOffset, -clampBounds, clampBounds);
        currentXOffset = Mathf.Clamp(currentXOffset, -clampBounds, clampBounds);
        transform.localRotation = Quaternion.Euler(originalRot.x - currentXOffset, originalRot.y + currentYOffset, transform.localEulerAngles.z);

        if (Physics.Raycast(transform.position, transform.forward, out RaycastHit hit, interactionDistance, interactionMask, QueryTriggerInteraction.Ignore) == true)
        {
            Debug.DrawRay(transform.position, transform.forward * interactionDistance, Color.green);
            camFeedText.text = "Trigger Dialogue";
        }
        else
        {
            Debug.DrawRay(transform.position, transform.forward * interactionDistance, Color.red);
            camFeedText.text = string.Empty;
        }
    }

    public bool Activate()
    {
        if(FeedToggledEvent.Invoke(true) == true)
        {
            gameObject.SetActive(true);
            camFeedText.transform.root.gameObject.SetActive(true);
            return true;
        }
        return false;
    }

    public bool Deactivate()
    {
        if (FeedToggledEvent.Invoke(false) == true)
        {
            gameObject.SetActive(false);
            camFeedText.transform.root.gameObject.SetActive(false);
            if (aSrc.clip == moveAudio)
            {
                aSrc.Stop();
                aSrc.clip = null;
                aSrc.loop = false;
            }
            return true;
        }
        return false;
    }
}

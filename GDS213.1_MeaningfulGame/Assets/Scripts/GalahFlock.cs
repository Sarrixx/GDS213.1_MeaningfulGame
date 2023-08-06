using UnityEngine;

public class GalahFlock : MonoBehaviour
{
    public delegate void GalahFlockEvent();

    [SerializeField] private Bounds groundBounds;
    [SerializeField] private Transform flightTarget;

    public Transform FlightTarget { get { return flightTarget; } }

    public event GalahFlockEvent TakeoffEvent;

    private void Update()
    {
        if (Input.GetKeyDown(KeyCode.Space))
        {
            TakeoffEvent.Invoke();
        }
    }

    public Vector3 GetRandomPositionInBounds()
    {
        return transform.position + groundBounds.center + new Vector3(Random.Range(-groundBounds.extents.x, groundBounds.extents.x),
            Random.Range(-groundBounds.extents.y, groundBounds.extents.y),
            Random.Range(-groundBounds.extents.z, groundBounds.extents.z));
    }

    private void OnDrawGizmos()
    {
        Gizmos.DrawWireCube(transform.position + groundBounds.center, groundBounds.size);
        if(flightTarget != null)
        {
            Gizmos.color = Color.red;
            Gizmos.DrawSphere(flightTarget.position, 0.5f);
        }
    }
}

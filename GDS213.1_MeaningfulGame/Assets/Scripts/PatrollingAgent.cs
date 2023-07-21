using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.AI;

public class PatrollingAgent : MonoBehaviour
{
    public enum PatrolPattern { roundRobin, random, pingPong }

    [SerializeField] private Transform[] waypoints;
    [SerializeField] private float idleTimeMin;
    [SerializeField] private float idleTimeMax;
    [SerializeField] private PatrolPattern pattern;
    [SerializeField] private Animator animator;
    [SerializeField] private LayerMask waterMask;

    private float idleTime = -1f;
    private float idleTimer = -1f;
    private int targetIndex = 0;
    private bool pathInverted = false;
    private bool swimming = false;
    private NavMeshAgent agent;
    private BoxCollider boxCollider;

    private void Awake()
    {
        TryGetComponent(out agent);
        TryGetComponent(out boxCollider);
    }

    // Start is called before the first frame update
    void Start()
    {
        if (idleTimeMin < 0)
        {
            idleTimeMin = 0;
        }
        if (idleTimeMax < idleTimeMin)
        {
            if (idleTimeMin > 0)
            {
                idleTimeMax = idleTimeMin;
            }
        }
        GoToNextWaypoint();
    }

    private void FixedUpdate()
    {
        if (swimming == false)
        {
            if (Physics.Raycast(transform.position + transform.forward * 0.125f, -transform.up, 0.05f, waterMask) == true)
            {
                if (Physics.Raycast(transform.position, -transform.up, 0.05f, waterMask) == true)
                {
                    if (animator != null)
                    {
                        animator.SetBool("swimming", true);
                    }
                    swimming = true;
                }
            }
        }
        else
        {
            if (Physics.Raycast(transform.position + transform.forward * 0.125f, -transform.up, 0.05f, waterMask) == false)
            {
                if (Physics.Raycast(transform.position, -transform.up, 0.05f, waterMask) == false)
                {
                    if (animator != null)
                    {
                        animator.SetBool("swimming", false);
                    }
                    swimming = false;
                }
            }
        }
    }

    private void OnDrawGizmos()
    {
        if (boxCollider != null)
        {
            Gizmos.color = Color.magenta;
            Gizmos.DrawRay(transform.position + transform.forward * 0.125f, -transform.up * 0.05f);
            Gizmos.DrawRay(transform.position, -transform.up * 0.05f);
            Gizmos.DrawRay(transform.position - transform.forward * 0.125f, -transform.up * 0.05f);
        }
    }

    // Update is called once per frame
    void Update()
    {
        if (agent.remainingDistance <= agent.stoppingDistance && idleTimer < 0)
        {
            if (animator != null)
            {
                animator.SetBool("moving", false);
            }
            agent.isStopped = true;
            idleTime = Random.Range(idleTimeMin, idleTimeMax);
            idleTimer = 0;
        }

        if (idleTimer >= 0)
        {
            idleTimer += Time.deltaTime;
            if (idleTimer > idleTime)
            {
                idleTimer = -1;
                GoToNextWaypoint();
            }
        }
    }

    private void GoToNextWaypoint()
    {
        targetIndex = GetNextTargetIndex();
        if(targetIndex >= 0 )
        {
            agent.isStopped = false;
            agent.SetDestination(waypoints[targetIndex].position);
            if (animator != null)
            {
                animator.SetBool("moving", true);
            }
        }
    }

    private int GetNextTargetIndex()
    {
        if(waypoints.Length == 0) { return -1; }
        switch(pattern)
        {
            default:
            case PatrolPattern.roundRobin:
                if(targetIndex + 1 >= waypoints.Length)
                {
                    return 0;
                }
                return targetIndex + 1;
            case PatrolPattern.random:
                return Random.Range(0, waypoints.Length);
            case PatrolPattern.pingPong:
                if (pathInverted == false)
                {
                    if (targetIndex + 1 >= waypoints.Length)
                    {
                        pathInverted = true;
                        return targetIndex - 1;
                    }
                    return targetIndex + 1;
                }
                else
                {
                    if (targetIndex - 1 < 0)
                    {
                        pathInverted = false;
                        return targetIndex + 1;
                    }
                    return targetIndex - 1;
                }
        }
    }
}

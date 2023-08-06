using UnityEngine;
using System.Collections;

public class Galah : MonoBehaviour {
    Animator galah;
    IEnumerator coroutine;
	// Use this for initialization
	void Start () {
        galah = GetComponent<Animator>();
	}
	
	// Update is called once per frame
	void Update ()
    {
        if (galah.GetCurrentAnimatorStateInfo(0).IsName("flying"))
        {
            //galah.SetBool("flyleft", false);
        }
        if (Input.GetKey(KeyCode.S))
        {
            galah.SetBool("idle", true);
            galah.SetBool("walking", false);
            galah.SetBool("eating", false);
        }
        if (Input.GetKeyDown(KeyCode.W))
        {
            galah.SetBool("walking", true);
            galah.SetBool("idle", false);
            galah.SetBool("eating", false);
        }
        if (Input.GetKeyUp(KeyCode.W))
        {
            galah.SetBool("walking", false);
            galah.SetBool("idle", true);
        }
        if (Input.GetKey(KeyCode.F))
        {
            galah.SetBool("eating", true);
            galah.SetBool("idle", false);
            galah.SetBool("walking", false);
            StartCoroutine("idle");
        }
        if (Input.GetKey(KeyCode.Space))
        {
            galah.SetBool("takeoff", true);
            galah.SetBool("idle",false);
            galah.SetBool("walking", false);
            StartCoroutine("flying");
        }
        if (Input.GetKey(KeyCode.Space))
        {
            galah.SetBool("landing", true);
            galah.SetBool("flying", false);
            StartCoroutine("idle");
        }
        if (Input.GetKey(KeyCode.Keypad0))
        {
            galah.SetBool("death", true);
            galah.SetBool("idle", false);
            galah.SetBool("walking", false);
        }
        if (Input.GetKey(KeyCode.E))
        {
            galah.SetBool("jumping", true);
            galah.SetBool("idle", false);
            StartCoroutine("idle");
        }
        if (Input.GetKeyDown(KeyCode.G))
        {
            galah.SetBool("flying", false);
            galah.SetBool("glide", true);
        }
        if (Input.GetKeyUp(KeyCode.G))
        {
            galah.SetBool("flying", true);
            galah.SetBool("glide", false);
        }
        if (Input.GetKeyDown(KeyCode.A))
        {
            galah.SetBool("flying", false);
            galah.SetBool("flyleft", true);
        }
        if (Input.GetKeyUp(KeyCode.A))
        {
            galah.SetBool("flyleft", false);
            galah.SetBool("flying", true);
        }
        if (Input.GetKeyDown(KeyCode.D))
        {
            galah.SetBool("flying", false);
            galah.SetBool("flyright", true);
        }
        if (Input.GetKeyUp(KeyCode.D))
        {
            galah.SetBool("flyright", false);
            galah.SetBool("flying", true);
        }
    }
    IEnumerator idle()
    {
        yield return new WaitForSeconds(0.2f);
        galah.SetBool("idle", true);
        galah.SetBool("eating", false);
        galah.SetBool("landing", false);
        galah.SetBool("jumping", false);
    }
    IEnumerator flying()
    {
        yield return new WaitForSeconds(0.8f);
        galah.SetBool("flying", true);
        galah.SetBool("takeoff", false);
        galah.SetBool("landing", false);
    }
}

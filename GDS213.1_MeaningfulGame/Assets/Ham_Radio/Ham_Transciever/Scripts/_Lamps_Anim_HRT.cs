using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class _Lamps_Anim_HRT : MonoBehaviour {

	public GameObject Display_01;
	public GameObject Display_02;

	void Start () {

		StartCoroutine(Disp());
		Display_01.GetComponent<MeshRenderer> ().enabled = false;
		Display_02.GetComponent<MeshRenderer> ().enabled = false;

	}

	IEnumerator Disp()
	{
		while(true)
		{
			Display_01.GetComponent<MeshRenderer> ().enabled = true;
			Display_02.GetComponent<MeshRenderer> ().enabled = false;
			yield return new WaitForSeconds(2);
			Display_01.GetComponent<MeshRenderer> ().enabled = false;
			Display_02.GetComponent<MeshRenderer> ().enabled = true;
			yield return new WaitForSeconds(1);

			yield return null;
	}
}
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewOrder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
	  return SizedBox(
		  width: double.infinity,
	    height: 60,
	    child: RaisedButton.icon(
		   
		  shape: RoundedRectangleBorder(),
		  color: Colors.white,
		  onPressed: () {
		  	Get.offNamed("/new_order");
		  },
		  label: Text(
			  "FAZER NOVO PEDIDO",
			  textAlign: TextAlign.start,
			  style: TextStyle(color: Colors.grey, fontSize: 20),
		  ),
		  icon: Icon(
			  Icons.add,
			  color: Colors.orange,
		  ),
	    ),
	  );
  }
}

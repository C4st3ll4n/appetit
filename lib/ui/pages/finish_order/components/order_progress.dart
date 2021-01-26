import 'package:flutter/material.dart';

class OrderProgress extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
	    crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
      	Row(
		      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      	  children: [
      	    Text("Finalizar pedido", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),textAlign: TextAlign.start,),
      	    Text("3 de 3", style: TextStyle(fontWeight: FontWeight.w300, fontSize: 18),textAlign: TextAlign.start,),
      	  ],
      	),
	      SizedBox(height: 10,),
	      LinearProgressIndicator(value: 1,backgroundColor: Colors.grey, minHeight: 10,)
      ],
    );
  }
}

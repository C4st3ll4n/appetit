import 'package:flutter/material.dart';

class OrderProgress extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
	    crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      	Row(
		      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      	  children: [
      	    Text("O que você está vendendo ?", style: TextStyle(fontWeight: FontWeight.w800, fontSize: 18),textAlign: TextAlign.start,),
      	    Text("1 de 3", style: TextStyle(fontWeight: FontWeight.w300, fontSize: 18),textAlign: TextAlign.start,),
      	  ],
      	),
	      SizedBox(height: 10,),
	      LinearProgressIndicator(value: 0.3,backgroundColor: Colors.grey, minHeight: 10,)
      ],
    );
  }
}

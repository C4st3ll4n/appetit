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
      	    Text("Para quem você está vendendo ?", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),textAlign: TextAlign.start,),
      	    Text("2 de 3", style: TextStyle(fontWeight: FontWeight.w300, fontSize: 18),textAlign: TextAlign.start,),
      	  ],
      	),
	      SizedBox(height: 10,),
	      LinearProgressIndicator(value: 0.7,backgroundColor: Colors.grey, minHeight: 10,)
      ],
    );
  }
}

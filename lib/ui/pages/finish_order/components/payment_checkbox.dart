
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../finish_order_presenter.dart';

class PaymentCheckbox extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		final presenter = Provider.of<FinishOrderPresenter>(context);
		
		return StreamBuilder<bool>(
		  stream: presenter.paymentState,
		  initialData: false,
		  builder: (context, snapshot) {
		  	log("${snapshot}");
		    return Container(
			    padding: EdgeInsets.all(8),
		    	child: Column(
				    crossAxisAlignment: CrossAxisAlignment.start,
		    		children: [
					    Text("O cliente já pagou ?", textAlign: TextAlign.start, style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),),
		    			PaymentListTile.yes(onClick: presenter.togglePaymentState, state: snapshot.data,),
		    			PaymentListTile.no(onClick: presenter.togglePaymentState, state: !snapshot.data,),
		    		],
		    	),
		    );
		  }
		);
	}
}

class PaymentListTile extends StatelessWidget {
	
	final String title;
	final Function onClick;
	final bool state;
 
	PaymentListTile({Key key, this.title, this.onClick, this.state=false}) : super(key: key);
	
	
	PaymentListTile.yes({ this.onClick, this.state=false}): title = "Sim";
	PaymentListTile.no({ this.onClick, this.state=true}): title = "Não";

  @override
  Widget build(BuildContext context) {
	
	  final _shape = RoundedRectangleBorder(
			  side: BorderSide(
					  color: Colors.black
			  )
	  );
    return Card(
	    shape: _shape,
	    child: ListTile(
		    onTap: onClick,
			    leading: IconButton(
				    icon: Icon(state?Icons.radio_button_checked:Icons.radio_button_unchecked, color: Theme.of(context).primaryColor,),
				    onPressed: onClick,
			    ),
			    title: Text("$title"),
	    ),
    );
  }
}


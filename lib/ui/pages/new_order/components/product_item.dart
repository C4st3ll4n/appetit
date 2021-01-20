import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../../domain/entities/entities.dart';

class ProductItem extends StatelessWidget {
	final ProductEntity product;

  const ProductItem({Key key, this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {
	  NumberFormat formatter = NumberFormat.currency(locale:"pt_BR", name:"reais", symbol:"R\$", decimalDigits: 2);
	  return Card(
		  child: ListTile(
			  title: Text(product.name),
			  subtitle: Text(product.options?.length>0==true?product.optionsName:null),
			  leading: CircleAvatar(
				  child: ClipRRect(
					  child: Image(
						  image: NetworkImage(product.imageNetworkPath),
					  ),
					  borderRadius: BorderRadius.circular(30),
				  ),
			  ),
			  trailing: Text("${formatter.format(product.price)}",style: TextStyle(fontWeight: FontWeight.bold),),
		  ),
	  );
  }
}

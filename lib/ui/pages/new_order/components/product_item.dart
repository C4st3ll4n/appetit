import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../../domain/entities/entities.dart';

class ProductItem extends StatelessWidget {
	final ProductEntity product;

  const ProductItem({Key key, this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {
	  NumberFormat formatter = NumberFormat.currency(locale:"pt_BR", name:"reais", symbol:"R\$", decimalDigits: 2);
	  
	  String options = "";
	  if(product.options!=null && product.options.length>0==true){
		  options = product.optionsName;
	  }else options = null;
	  return Card(
		  child: ListTile(
			  title: Text(product.name),
			  subtitle: options!=null?Text(options):null,
			  leading: CircleAvatar(
				  
				  child: ClipRRect(
					  child: Image(
						  image: NetworkImage(product.imageNetworkPath),
						  fit: BoxFit.cover,
					  ),
					  borderRadius: BorderRadius.circular(30),
				  ),
			  ),
			  trailing: Text("${formatter.format(product.price)}",style: TextStyle(fontWeight: FontWeight.bold),),
		  ),
	  );
  }
}

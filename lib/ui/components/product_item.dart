import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../../domain/entities/entities.dart';
import '../pages/new_order/new_order_presenter.dart';

class ProductItem extends StatelessWidget {
	final ProductEntity product;

  const ProductItem({Key key, this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {
	  final presenter = Provider.of<NewOrderPresenter>(context);
	  NumberFormat formatter = NumberFormat.currency(locale:"pt_BR", name:"reais", symbol:"R\$", decimalDigits: 2);
	  
	  String options = "";
	  if(product.options!=null && product.options.length>0==true){
		  options = product.optionsName;
	  }else options = null;
	  return Card(
		  child: ListTile(
			  onTap: (){
			  	Get.offNamed("/order_details", arguments: {"product":product.toJson()});
			  },
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

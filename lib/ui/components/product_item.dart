import 'package:fappetite/presentation/presenters/getx_new_order_presenter.dart';
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
    final GetXNewOrderPresenter presenter = Provider.of<NewOrderPresenter>(context);
    NumberFormat formatter = NumberFormat.currency(
        locale: "pt_BR", name: "reais", symbol: "R\$", decimalDigits: 2);
    
    final titleTextStyleSelected = TextStyle(
      color: Colors.white,
    );
    final subtitleTextStyleSelected = TextStyle(
      color: Colors.white,
    );

    String options = "";
    if (product.options != null && product.options.length > 0 == true) {
      options = product.optionsName;
    } else
      options = null;

    final selected = presenter.contains(product);
    return Card(
      elevation: 2,
      child: ListTile(
        selected: selected,
        selectedTileColor: Theme.of(context).primaryColor,
        onTap: () {
          //presenter.goToProductDetails(product);
        },
        onLongPress: (){
          presenter.toggleProduct(product);
        },
        title: Text(
          product.name,
          style: selected ? titleTextStyleSelected : null,
        ),
        subtitle: options != null
            ? Text(
                options,
                style: selected ? subtitleTextStyleSelected : null,
              )
            : null,
        leading: CircleAvatar(
          child: ClipRRect(
            child: Image(
              image: NetworkImage(product.imageNetworkPath),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        trailing: Text(
          "${formatter.format(product.price)}",
          style: TextStyle(
              color: selected ? Colors.white : Colors.black,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

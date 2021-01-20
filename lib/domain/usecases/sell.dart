import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

abstract class Sell{
	Future make();
	Future listProduct(ProductParams params);
	Future listClient(ClientParams params);
}

class ClientParams extends Equatable {
	final String name;

  ClientParams(this.name);

  @override
  List<Object> get props => [name];
}

class ProductParams extends Equatable {
	final String observation;
	final String product;
	final String flavor;
	final String client;

  ProductParams({
	  @required this.observation, @required this.product,
	  @required this.flavor,@required this.client});
	
  @override
  List<Object> get props => [client, product, flavor];
}
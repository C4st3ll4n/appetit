import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

class ProductEntity extends Equatable{
	final String name;
	final String category;
	final double price;
	final List<String> options;
  String imageNetworkPath;
  
	String get optionsName {
		String optionName = null;
	  for(String i in options){
		  optionName+="$i,";
	  }
	  return optionName;
	}
  ProductEntity({@required this.name, @required this.price, this.options,@required this.category, this.imageNetworkPath});

  @override
  List<Object> get props => [name, price];
}
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

class ProductEntity extends Equatable {
  final String name;
  final String category;
  final double price;
  final List<String> options;
  String imageNetworkPath;

  String get optionsName {
    String optionName = "";
    for (String i in options) {
      optionName += "$i, ";
    }
    return optionName;
  }

  ProductEntity(
      {@required this.name,
      @required this.price,
      this.options,
      @required this.category,
      this.imageNetworkPath});

  @override
  List<Object> get props => [name, price];

  Map toJson() => {
        "name": name,
        "category": category,
        "price": price,
        "options": options,
        "imageNetworkPath": imageNetworkPath
      };

  factory ProductEntity.fromJson(Map json) =>
      ProductEntity(name: json['name'],
          price: json['price'],
          category: json['category'],
      imageNetworkPath: json['imageNetworkPath'],
      options: json['options']);
}

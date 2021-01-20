import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

class OrderEntity extends Equatable {
  final String clientName;
  final String description;
  final double totalPrice;
  String imageNetworkPath;
  final String soldDay;
  final String soldMonth;

  OrderEntity(
      {@required this.clientName,
      @required this.description,
      @required this.totalPrice,
      @required this.soldDay,
      @required this.soldMonth,
      this.imageNetworkPath});

  @override
  List<Object> get props => [clientName, totalPrice, description];

  @override
  bool get stringify => true;
}

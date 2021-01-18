import 'package:equatable/equatable.dart';

class OrderEntity extends Equatable {
  final String clientName;
  final String description;
  final double totalPrice;

  OrderEntity({
      this.clientName,
      this.description,
      this.totalPrice});

  @override
  List<Object> get props => [clientName, totalPrice, description];
}

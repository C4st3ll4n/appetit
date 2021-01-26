import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

class ClientEntity extends Equatable {
  final String name;
  String imageNetworkPath;

  ClientEntity({@required this.name, @required this.imageNetworkPath});

  @override
  List<Object> get props => [name, imageNetworkPath];

  @override
  bool get stringify => true;
}

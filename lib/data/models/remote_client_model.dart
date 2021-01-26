import 'package:fappetite/domain/entities/entities.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

class RemoteClientModel extends Equatable {
	final String name;
	String imgPath;
	
	RemoteClientModel({@required this.name, @required this.imgPath});
	
	@override
	List<Object> get props => [name, imgPath];
	
	@override
	bool get stringify => true;
	
	ClientEntity toEntity() => ClientEntity(name: name,
			imageNetworkPath: imgPath);
}

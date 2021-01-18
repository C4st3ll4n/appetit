import 'package:meta/meta.dart';
import 'package:fappetite/data/http/http.dart';
import 'package:fappetite/domain/entities/entities.dart';

const String kDescription = "description";
const String kClientName = "clientName";
const String kTotalPrice = "totalPrice";
const String kImagePath = "imagePath";

class RemoteOrderModel {
	final String imagePath;
	final String clientName;
	final String description;
	final double totalPriceInReais;
	
	
	RemoteOrderModel({ @required this.clientName, @required this.description,
		@required this.totalPriceInReais, @required this.imagePath});
	
	factory RemoteOrderModel.fromJson(Map json) {
		if (! json.containsKey(kDescription)
				|| ! json.containsKey(kClientName)
				|| ! json.containsKey(kTotalPrice))
			throw HttpError.invalidData;
		return RemoteOrderModel(clientName: json[kClientName],
				description: json[kDescription], totalPriceInReais: json[kTotalPrice],
				imagePath: json[kImagePath]);
	}
	
	OrderEntity toEntity() =>
			OrderEntity(clientName: clientName,
					description: description,
					totalPrice: totalPriceInReais);
}

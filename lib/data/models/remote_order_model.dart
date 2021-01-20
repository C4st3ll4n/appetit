import 'package:meta/meta.dart';
import 'package:fappetite/data/http/http.dart';
import 'package:fappetite/domain/entities/entities.dart';

const String kDescription = "description";
const String kClientName = "clientName";
const String kTotalPrice = "totalPrice";
const String kImagePath = "imagePath";
const String kTimestamp = "timestamp";

class RemoteOrderModel {
  final String imagePath;
  final String clientName;
  final String description;
  final double totalPriceInReais;
  final String timestamp;

  RemoteOrderModel(
      {@required this.clientName,
      @required this.description,
      @required this.totalPriceInReais,
      @required this.imagePath,
      this.timestamp});

  factory RemoteOrderModel.fromJson(Map json) {
    if (!json.containsKey(kDescription) ||
        !json.containsKey(kClientName) ||
        !json.containsKey(kTotalPrice)) throw HttpError.invalidData;
    return RemoteOrderModel(
        clientName: json[kClientName],
        description: json[kDescription],
        totalPriceInReais: json[kTotalPrice],
        imagePath: json[kImagePath]);
  }

  OrderEntity toEntity() {
    String day, month;

    final _dt = DateTime.fromMillisecondsSinceEpoch(int.parse(timestamp),isUtc: true);
    month = "${_dt.month}";
    day = "${_dt.day}";

    return OrderEntity(
        clientName: clientName,
        description: description,
        totalPrice: totalPriceInReais,
        imageNetworkPath: imagePath,
        soldDay: day,
        soldMonth: month);
  }
}

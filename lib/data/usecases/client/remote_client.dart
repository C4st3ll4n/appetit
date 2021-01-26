import 'package:fappetite/data/models/models.dart';
import 'package:fappetite/data/models/remote_order_model.dart';
import 'package:fappetite/domain/usecases/client.dart';
import 'package:fappetite/domain/usecases/search_order.dart';
import 'package:meta/meta.dart';
import '../../../data/models/remote_account_model.dart';

import '../../../domain/helpers/helpers.dart';
import '../../../domain/usecases/usecases.dart';
import '../../../domain/entities/entities.dart';

import '../../http/http.dart';

class RemoteClient implements Client {
  final HttpClient httpClient;
  final String url;

  RemoteClient({@required this.httpClient, @required this.url});

  @override
  Future<List<ClientEntity>> list() async {
    try {
      Map response =
          await httpClient.request(url: url, method: 'get');

      /// MOCKANDO RESPOSTA DE AUTENTICAÇÃO
      response = {
        "clients": []
      };

      /*return response.values.map(
							(order) => RemoteOrderModel.fromJson(order).toEntity())
					.toList();*/

      return [
        RemoteClientModel(name: "Justine Marshall",
            imgPath: "https://randomuser.me/api/portraits/women/30.jpg",
        ).toEntity(),
  
        RemoteClientModel(name: "Pedro Henrique",
          imgPath: "https://instagram.frao5-1.fna.fbcdn.net/v/t51.2885-15/sh0.08/e35/p640x640/116430409_166226154993976_6214333471908847967_n.jpg?_nc_ht=instagram.frao5-1.fna.fbcdn.net&_nc_cat=104&_nc_ohc=bG6iEQ_mOBYAX-OXcoQ&tp=1&oh=3edc88dbe14a4f6da3e271fb0d26fa13&oe=60300186",
            ).toEntity(),
  
        RemoteClientModel(name: "Bairam Frootan",
          imgPath: "https://randomuser.me/api/portraits/women/50.jpg",
            ).toEntity(),
        
      ];

      /*
       "description"
"clientName"
"totalPrice"
"imagePath"
       */

    } on HttpError catch (error) {
      throw error == HttpError.unauthorized
          ? DomainError.invalidCredentials
          : DomainError.unexpected;
    }
  }
}

class RemoteSearchOrderParams {
  final String search;

  RemoteSearchOrderParams({@required this.search});

  factory RemoteSearchOrderParams.fromDomain(SearchParams entity) =>
      RemoteSearchOrderParams(search: entity.search);

  Map toJson() => {'search': search};
}

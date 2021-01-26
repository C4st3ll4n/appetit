import 'dart:developer';

import 'package:fappetite/data/models/remote_order_model.dart';
import 'package:fappetite/domain/usecases/search_order.dart';
import 'package:meta/meta.dart';
import '../../../data/models/remote_account_model.dart';

import '../../../domain/helpers/helpers.dart';
import '../../../domain/usecases/usecases.dart';
import '../../../domain/entities/entities.dart';

import '../../http/http.dart';

class RemoteSearchOrder implements SearchOrder {
  final HttpClient httpClient;
  final String url;

  RemoteSearchOrder({@required this.httpClient, @required this.url});

  @override
  Future<List<OrderEntity>> search(SearchParams params) async {
    //final Map body = {'email':authenticationParams.email, 'password':authenticationParams.secret};
    try {
      final body = RemoteSearchOrderParams.fromDomain(params).toJson();

      //Map response =          await httpClient.request(url: url, method: 'post', body: body);

      /// MOCKANDO RESPOSTA DE AUTENTICAÇÃO
      final response = {
        "orders": [
          {
            "description": "1x Cuscuz com calabresa, 1x salgado",
            "clientName": "Hanna Montana",
            "totalPrice": 05.50,
            "imagePath": "https://randomuser.me/api/portraits/women/30.jpg"
          },
          {
            "description": "2x salgado, 1x pão de queijo.",
            "clientName": "Pablo Alvarez",
            "totalPrice": 05.50,
            "imagePath": "https://randomuser.me/api/portraits/men/83.jpg"
          },
          {
            "description": "1x misto quente, 1x pão com mortadela",
            "clientName": "Andreia Barros",
            "totalPrice": 05.50,
            "imagePath": "https://randomuser.me/api/portraits/women/50.jpg"
          },
        ]
      };

      /*return response.values.map(
							(order) => RemoteOrderModel.fromJson(order).toEntity())
					.toList();*/

      return [
        RemoteOrderModel(clientName: "Hanna Montana", description: "1x Cuscuz com calabresa, 1x salgado.", totalPriceInReais:  05.50,
            imagePath: "https://randomuser.me/api/portraits/women/30.jpg", timestamp: "1607623881000").toEntity(),
        RemoteOrderModel(clientName: "Pablo Alvarez", description: "2x salgado, 1x pão de queijo.", totalPriceInReais:  05.50,
            imagePath: "https://instagram.frao5-1.fna.fbcdn.net/v/t51.2885-15/sh0.08/e35/p640x640/116430409_166226154993976_6214333471908847967_n.jpg?_nc_ht=instagram.frao5-1.fna.fbcdn.net&_nc_cat=104&_nc_ohc=bG6iEQ_mOBYAX-OXcoQ&tp=1&oh=3edc88dbe14a4f6da3e271fb0d26fa13&oe=60300186", timestamp: "1607623881000").toEntity(),
  
        RemoteOrderModel(clientName: "Andreia Barros", description: "1x misto quente, 1x pão com mortadela.", totalPriceInReais:  05.50,
            imagePath: "https://randomuser.me/api/portraits/women/50.jpg", timestamp: "1607623881000").toEntity(),

        RemoteOrderModel(clientName: "Pedro Henrique", description: "3x pão de queijo.", totalPriceInReais:  05.50,
            imagePath: "https://randomuser.me/api/portraits/women/30.jpg", timestamp: "1607623881000").toEntity(),
  
        RemoteOrderModel(clientName: "Hanna Montana", description: "1x Cuscuz com calabresa, 1x salgado.", totalPriceInReais:  05.50,
            imagePath: "https://randomuser.me/api/portraits/women/30.jpg", timestamp: "1608487881000").toEntity(),
        
        RemoteOrderModel(clientName: "Pablo Alvarez", description: "2x salgado, 1x pão de queijo.", totalPriceInReais:  05.50,
            imagePath: "https://instagram.frao5-1.fna.fbcdn.net/v/t51.2885-15/sh0.08/e35/p640x640/116430409_166226154993976_6214333471908847967_n.jpg?_nc_ht=instagram.frao5-1.fna.fbcdn.net&_nc_cat=104&_nc_ohc=bG6iEQ_mOBYAX-OXcoQ&tp=1&oh=3edc88dbe14a4f6da3e271fb0d26fa13&oe=60300186", timestamp: "1608487881000").toEntity(),
  
        RemoteOrderModel(clientName: "Andreia Barros", description: "1x misto quente, 1x pão com mortadela.", totalPriceInReais:  05.50,
            imagePath: "https://randomuser.me/api/portraits/women/50.jpg", timestamp: "1608487881000").toEntity(),
  
        RemoteOrderModel(clientName: "Pedro Henrique", description: "3x pão de queijo.", totalPriceInReais:  05.50,
            imagePath: "https://randomuser.me/api/portraits/women/30.jpg", timestamp: "1608487881000").toEntity()

      ];

      /*
       "description"
"clientName"
"totalPrice"
"imagePath"
       */

    } on HttpError catch (error, stack) {
      log("\n\n ############\n${error.toString()}\n${stack.toString()}############\n\n");
      throw error == HttpError.unauthorized
          ? DomainError.invalidCredentials
          : DomainError.unexpected;
    }catch(error, stack){
      log("\n\n ############\n${error.toString()}\n${stack.toString()}############\n\n");
  
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

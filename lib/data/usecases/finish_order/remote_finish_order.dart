import 'dart:developer';

import 'package:faker/faker.dart';
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

class RemoteFinishOrder implements FinishOrder {
  final HttpClient httpClient;
  final String url;

  RemoteFinishOrder({@required this.httpClient, @required this.url});

  @override
  Future<bool> finish(FinishParams params) async {
    try {
      //Map response =          await httpClient.request(url: url, method: 'get');
      Future.delayed(Duration(seconds: 2));
      /// MOCKANDO RESPOSTA DE AUTENTICAÇÃO
      /*response = {
        "clients": []
      };*/

      /*return response.values.map(
							(order) => RemoteOrderModel.fromJson(order).toEntity())
					.toList();*/

      return faker.randomGenerator.boolean();


    } on HttpError catch (e, stack) {
      log("\n\n ############\n${e.toString()}\n${stack.toString()}############\n\n");
  
      throw e == HttpError.unauthorized
          ? DomainError.invalidCredentials
          : DomainError.unexpected;
    }catch(e, stack){
      log("\n\n ############\n${e.toString()}\n${stack.toString()}############\n\n");
    }
  }
}

class RemoteFinishParams {
  final bool isPaid;
  final String date;

  RemoteFinishParams({this.isPaid, this.date});

}

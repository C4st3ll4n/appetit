import 'dart:convert';
import 'dart:developer';

import 'package:faker/faker.dart';
import 'package:http/http.dart';
import 'package:meta/meta.dart';

import '../../data/http/http.dart';

class HttpAdapter implements HttpClient {
  HttpAdapter(this.client);

  final Client client;

  @override
  Future<Map> request(
      {@required String url, @required String method, Map body}) async {
    final headers = {
      'content-type': 'application/json',
      'accept': 'application/json',
    };
    var jsonBody = body != null ? jsonEncode(body) : null;
    Response response = Response('', 500);
    try {
      if (method == 'post') {
        /// SIMULANDO UMA REQUISIÇÃO :: ALGUMAS IRÃO FALHAR PROPOSITALMENTE
        response = await Future.delayed(
          Duration(seconds: 2),
          () {
            if (random.integer(10)==0) return Response("", 200);

            return Response("", random.integer(500, min: 400));
          },
        );
      }else if(method == 'get'){
        response = await Future.delayed(
          Duration(seconds: 2),
              () {
            if (random.boolean()) return Response("", 200);
      
            return Response(null, random.integer(500, min: 400));
          },
        );
      }
    } catch (e, stack) {
      log("\n\n ############\n${e.toString()}\n${stack.toString()}############\n\n");
      throw HttpError.serverError;
    }

    //if(body?.containsKey("EOQ")??false) return {'any_key':'any_value'}; //FIXME

    return _handleResponse(response);
  }

  Map _handleResponse(Response response) {
    if (response.statusCode == 200) {
      return response.body.isNotEmpty ? json.decode(response.body) : null;
    } else if (response.statusCode == 204) {
      return null;
    } else if (response.statusCode == 400) {
      throw HttpError.badRequest;
    } else if (response.statusCode == 401) {
      throw HttpError.unauthorized;
    } else if (response.statusCode == 403) {
      throw HttpError.forbidden;
    } else if (response.statusCode == 404) {
      throw HttpError.notFound;
    } else {
      throw HttpError.serverError;
    }
  }
}

import 'dart:developer';

import 'package:meta/meta.dart';
import '../../../data/models/remote_account_model.dart';

import '../../../domain/helpers/helpers.dart';
import '../../../domain/usecases/usecases.dart';
import '../../../domain/entities/entities.dart';

import '../../http/http.dart';

class RemoteAuthentication implements Authentication{
  final HttpClient httpClient;
  final String url;

  RemoteAuthentication({@required this.httpClient, @required this.url});

  Future<AccountEntity> auth(AuthenticationParams authenticationParams) async {
    //final Map body = {'email':authenticationParams.email, 'password':authenticationParams.secret};
    try {
      final body =
          RemoteAuthenticationParams.fromDomain(authenticationParams).toJson();
      
      //Map response = await httpClient.request(url: url, method: 'post', body: body);
      await Future.delayed(Duration(seconds: 2));
      
      /// MOCKANDO RESPOSTA DE AUTENTICAÇÃO
      final response = {"accessToken":"QWERTYYTREWQ"};
      
      return RemoteAccountModel.fromJson(response).toEntity();
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

class RemoteAuthenticationParams {
  final String email;
  final String password;

  RemoteAuthenticationParams({@required this.email, @required this.password});

  factory RemoteAuthenticationParams.fromDomain(AuthenticationParams entity) =>
      RemoteAuthenticationParams(email: entity.email, password: entity.secret);

  Map toJson() => {'email': email, 'password': password};
}

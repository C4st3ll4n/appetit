import 'dart:developer';

import 'package:meta/meta.dart';
import '../../http/http.dart';
import '../../../domain/usecases/sell.dart';
import '../../../domain/entities/entities.dart';
import '../../../domain/helpers/helpers.dart';

class RemoteSell implements Sell {
  final HttpClient httpClient;
  final String url;

  RemoteSell({@required this.httpClient, @required this.url});

  @override
  Future<List<ProductEntity>> listProduct(ProductParams params)async {
    try {
      final body = RemoteSellParams.fromDomain(params).toJson();
  
//      Map response =      await httpClient.request(url: url, method: 'post', body: body);
      await Future.delayed(Duration(seconds: 1));

      return [
        ProductEntity(name: "Cuscuz simples", price: 02.25, category: "Cuscuz", options: ["Milho", "Arroz"], imageNetworkPath: "https://img.estadao.com.br/fotos/crop/960x540/resources/jpg/3/3/1565234690333.jpg"),
        ProductEntity(name: "Cuscuz completo", price: 03.25, category: "Cuscuz", options: ["Milho", "Arroz"], imageNetworkPath: "https://i.pinimg.com/originals/a2/bb/e2/a2bbe29f2e8bee12b08befcc60564839.jpg"),
        
        ProductEntity(name: "Misto quente (pq.)", price: 03.00, category: "Misto Quente", imageNetworkPath: "https://craftlog.com/m/i/1507367"),
        ProductEntity(name: "Misto quente (gr.)", price: 04.00, category: "Misto Quente", imageNetworkPath: "https://craftlog.com/m/i/1507367"),
        
        ProductEntity(name: "Pão caseiro completo", price: 03.25, category: "Pão", imageNetworkPath: "https://i.ytimg.com/vi/1npXIb-3Oe0/maxresdefault.jpg"),
        ProductEntity(name: "Pão caseiro", price: 02.25, category: "Pão", imageNetworkPath: "https://cozinhalegal.com.br/files/receitas/684/Pao-caseiro-simples-8.jpg"),
      ];
      
    } on HttpError catch (error, stack) {
      log("\n\n ############\n${error.toString()}\n${stack.toString()}############\n\n");
  
      throw error == HttpError.unauthorized
          ? DomainError.invalidCredentials
          : DomainError.unexpected;
    }catch(error, stack){
      log("\n\n ############\n${error.toString()}\n${stack.toString()}############\n\n");
  
    }
  }

  @override
  Future make() {
  }

  @override
  Future listClient(ClientParams params) {
    throw UnimplementedError();
  }
}

class RemoteSellParams {
  final String productName;

  RemoteSellParams(this.productName);
  
  factory RemoteSellParams.fromDomain(ProductParams params)=>
  RemoteSellParams(params.product);
  
  Map toJson() => {'productName':productName};
  
}

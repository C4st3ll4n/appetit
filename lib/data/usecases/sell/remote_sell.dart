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
  
      Map response =
      await httpClient.request(url: url, method: 'post', body: body);


      return [
        ProductEntity(name: "Cuscuz simples", price: 02.25, category: "Cuscuz", options: ["Milho", "Arroz"]),
        ProductEntity(name: "Cuscuz completo", price: 03.25, category: "Cuscuz", options: ["Milho", "Arroz"]),
        
        ProductEntity(name: "Pão caseiro", price: 02.25, category: "Pão"),
        ProductEntity(name: "Pão caseiro completo", price: 03.25, category: "Pão"),
        
        ProductEntity(name: "Misto quente (pq.)", price: 03.00, category: "Misto Quente"),
        ProductEntity(name: "Misto quente (gr.)", price: 04.00, category: "Misto Quente"),
      ];
      
    } on HttpError catch (error) {
      throw error == HttpError.unauthorized
          ? DomainError.invalidCredentials
          : DomainError.unexpected;
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

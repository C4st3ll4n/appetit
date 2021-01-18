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
			final body =
			RemoteSearchOrderParams.fromDomain(params).toJson();
			
			Map response = await httpClient.request(
					url: url, method: 'post', body: body);
			
			/// MOCKANDO RESPOSTA DE AUTENTICAÇÃO
			response = {"orders": [
				{"description":"1x Cuscuz com calabresa, 1x salgado",
					"clientName":"Hanna Montana",
					"totalPrice":05.50,
					"imagePath":
				"https://randomuser.me/api/portraits/women/30.jpg"},
				
				{"description":"2x salgado, 1x pão de queijo.",
					"clientName":"Pablo Alvarez",
					"totalPrice":05.50,
					"imagePath":"https://randomuser.me/api/portraits/men/83.jpg"},
				
				{"description":"1x misto quente, 1x pão com mortadela",
					"clientName":"Andreia Barros",
					"totalPrice":05.50,
					"imagePath":"https://randomuser.me/api/portraits/women/50.jpg"},
			]
			};
			return response['orders'].values.map(
							(order) => RemoteOrderModel.fromJson(order).toEntity())
					.toList();
		
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

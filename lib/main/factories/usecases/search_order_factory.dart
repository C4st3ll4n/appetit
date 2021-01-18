import '../../../data/usecases/usecases.dart';
import '../../../domain/usecases/search_order.dart';
import '../factories.dart';

SearchOrder makeSearchOrder() => RemoteSearchOrder
	(httpClient: makeHttpAdapter(), url: "any");
import '../../../domain/usecases/sell.dart';
import '../../../data/usecases/usecases.dart';
import '../factories.dart';

Sell makeSell() => RemoteSell
	(httpClient: makeHttpAdapter(), url: "any");
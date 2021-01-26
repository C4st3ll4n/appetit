import 'package:fappetite/data/usecases/client/client.dart';
import 'package:fappetite/domain/usecases/usecases.dart';
import 'package:fappetite/main/factories/factories.dart';

import '../../../../presentation/presenters/presenters.dart';
import '../../../../ui/pages/client_order/client_order_presenter.dart';

ClientOrderPresenter makeGetXClientOrderPresenter() => GetClientOrderPresenter(client: makeClient());

Client makeClient()=> RemoteClient(httpClient: makeHttpAdapter(), url: "");
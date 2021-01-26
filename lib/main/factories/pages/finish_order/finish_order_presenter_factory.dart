import 'package:fappetite/data/usecases/client/client.dart';
import 'package:fappetite/data/usecases/finish_order/finish_order.dart';
import 'package:fappetite/domain/usecases/usecases.dart';
import 'package:fappetite/main/factories/factories.dart';
import 'package:fappetite/presentation/presenters/getx_finish_order_presenter.dart';
import 'package:fappetite/ui/pages/finish_order/finish_order_presenter.dart';

import '../../../../presentation/presenters/presenters.dart';

FinishOrderPresenter makeGetXFinishOrderPresenter() => GetXFinishOrderPresenter(finishOrder: makeFinishOrder());

FinishOrder makeFinishOrder()=> RemoteFinishOrder(httpClient: makeHttpAdapter(), url: "");
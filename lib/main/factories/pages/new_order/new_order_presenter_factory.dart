import '../../usecases/sell_factory.dart';
import '../../../../presentation/presenters/getx_new_order_presenter.dart';
import '../../../../ui/pages/new_order/new_order_presenter.dart';


NewOrderPresenter makeGetXNewOrderPresenter() => GetXNewOrderPresenter(
		sell: makeSell(),
);
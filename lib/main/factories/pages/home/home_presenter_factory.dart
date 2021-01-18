import '../../../../presentation/presenters/presenters.dart';
import '../../../../ui/pages/home/home_presenter.dart';
import '../../factories.dart';

HomePresenter makeGetXHomePresenter() => GetXHomePresenter(
		searchOrder:makeSearchOrder(), validation:makeSearchValidation(),
);
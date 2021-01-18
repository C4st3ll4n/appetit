import '../../../../presentation/presenters/presenters.dart';
import '../../../../ui/pages/login/login_presenter.dart';
import '../../factories.dart';

LoginPresenter makeGetXLoginPresenter() => GetXLoginPresenter(
		validation: makeLoginValidation(),
	authentication: makeRemoteAuthentication(),);
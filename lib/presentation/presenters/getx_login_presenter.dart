import 'dart:developer';

import 'package:get/get.dart';
import 'package:meta/meta.dart';
import '../../domain/entities/account_entity.dart';

import '../protocols/protocols.dart';

import '../../domain/helpers/domain_error.dart';
import '../../domain/usecases/authentication.dart';

import '../../ui/pages/login/login_presenter.dart';

class GetXLoginPresenter extends GetxController implements LoginPresenter {
  final Validation validation;
  final Authentication authentication;

  String _email;
  String _password;

  var _emailError = RxString();
  var _passwordError = RxString();
  var _mainError = RxString();
  var _navigateTo = RxString();

  var _isFormValid = false.obs;
  var _isLoading = false.obs;

  GetXLoginPresenter({
    @required this.validation,
    @required this.authentication,
  });

  @override
  Stream<String> get emailErrorStream => _emailError.stream.distinct();

  @override
  Stream<bool> get isFormValidStream => _isFormValid.stream.distinct();

  @override
  Stream<bool> get isLoadingStream => _isLoading.stream.distinct();

  @override
  Stream<String> get mainErrorStream => _mainError.stream.distinct();

  @override
  Stream<String> get passwordErrorStream => _passwordError.stream.distinct();

  @override
  Stream<String> get navigateToStream => _navigateTo.stream.distinct();

  @override
  Future<void> auth() async {
    _mainError.value = null;
    _isLoading.value = true;

    try {
      final AccountEntity account = await authentication.auth(
        AuthenticationParams(email: _email, secret: _password),
      );

      _navigateTo.value = "/orders";
    } on DomainError catch (error, stack) {
      log("\n\n ############\n${error.toString()}\n${stack.toString()}############\n\n");
      _mainError.value = error.description;
      _isLoading.value = false;
    }catch(error, stack){
      log("\n\n ############\n${error.toString()}\n${stack.toString()}############\n\n");
    }
  }

  /// Unnecesary: GetX automatcally disposes
  @override
  void dispose() {}

  @override
  void validateEmail(String email) {
    _email = email;
    _emailError.value = validation.validate(field: "email", value: email);
    validateForm();
  }

  @override
  void validatePassword(String password) {
    _password = password;
    _passwordError.value =
        validation.validate(field: "password", value: password);
    validateForm();
  }

  void validateForm() => _isFormValid.value = _emailError.value == null &&
      _passwordError.value == null &&
      _email != null &&
      _password != null;
}

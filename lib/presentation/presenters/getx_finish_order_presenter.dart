import 'dart:developer';

import 'package:fappetite/domain/usecases/finish_order.dart';
import 'package:fappetite/ui/pages/finish_order/finish_order_presenter.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';
import '../../domain/entities/account_entity.dart';

import '../protocols/protocols.dart';

import '../../domain/helpers/domain_error.dart';
import '../../domain/usecases/authentication.dart';

import '../../ui/pages/login/login_presenter.dart';

class GetXFinishOrderPresenter extends GetxController implements FinishOrderPresenter {
  final FinishOrder finishOrder;
  
  String date;
  var isPaid = RxBool(false);
  
  var _mainError = RxString();
  var _navigateTo = RxString();

  var _successful = RxBool();
  var _isLoading = false.obs;
  var _isFormValid = false.obs;

  GetXFinishOrderPresenter({
    @required this.finishOrder,
  });

  @override
  Stream<bool> get isLoadingStream => _isLoading.stream.distinct();

  @override
  Stream<String> get mainErrorStream => _mainError.stream.distinct();

  @override
  Stream<String> get navigateToStream => _navigateTo.stream.distinct();

  @override
  Stream<bool> get successful => _successful.stream.distinct();

  @override
  Future finish() async {
    _mainError.value = null;
    _isLoading.value = true;

    try {
      final result = await finishOrder.finish(FinishParams(isPaid: isPaid.value, date: date));
      _successful.value = result;
      if(_successful.isTrue){
        _navigateTo.value = "/successful_order";
      }
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
  void goBack() {
    _navigateTo.value = "/client_order";
    _navigateTo.value = null;
  }

  @override
  Stream<bool> get isFormValid => _isFormValid.stream.distinct();
  
  void setPaid(bool value){
    isPaid.value = value;
    validateForm();
  }
  
  void setDate(String value){
    date = value;
    validateForm();
  }
  
  void validateForm() => _isFormValid.value =  date !=null && isPaid != null && date.isNotEmpty;

  @override
  Stream<bool> get paymentState => isPaid.stream.distinct();

  @override
  void togglePaymentState() => isPaid.value = !isPaid.value;

}

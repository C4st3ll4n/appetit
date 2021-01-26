
import 'package:fappetite/domain/entities/client_entity.dart';

abstract class FinishOrderPresenter{
  
  Stream<bool> get successful;
  Stream<bool> get paymentState;
  
  Stream<String> get mainErrorStream;
  
  Stream<String> get navigateToStream;
  
  Stream<bool> get isLoadingStream;
  Stream<bool> get isFormValid;
  
  void dispose();
  
  Future finish();
  
  void goBack();
  
  void togglePaymentState();
}
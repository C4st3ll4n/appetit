import 'package:fappetite/domain/entities/entities.dart';

abstract class NewOrderPresenter{
  
  Stream<List> get dataStream;
  
  Stream<String> get searchStream;
  
  Stream<String> get searchErrorStream;
  
  Stream<String> get navigateToStream;
  
  Stream<bool> get isLoadingStream;
  
  Stream<bool> get showBottomBar;
  
  void dispose();
  
  void goToHome();
  
  void goToProductDetails(ProductEntity product);
  
  Future<void> search();
  
  void newSearch(String value);

  void goToSelectClient();

}
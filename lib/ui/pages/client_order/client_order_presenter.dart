
abstract class ClientOrderPresenter{
  
  Stream<List> get dataStream;
  
  Stream<String> get searchStream;
  
  Stream<String> get searchErrorStream;
  
  Stream<String> get navigateToStream;
  
  Stream<bool> get isLoadingStream;
  
  void dispose();
  
  void goToFinishOrder();
  
  Future<void> search();
  
  void newSearch(String value);

  void goBack();

}
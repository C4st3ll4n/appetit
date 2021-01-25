abstract class NewOrderPresenter{
  
  Stream<List> get dataStream;
  
  Stream<String> get searchStream;
  
  Stream<String> get searchErrorStream;
  
  Stream<String> get navigateToStream;
  
  Stream<bool> get isLoadingStream;
  
  void dispose();
  
  void goToHome();
  
  Future<void> search();
  
  void newSearch(String value);

}
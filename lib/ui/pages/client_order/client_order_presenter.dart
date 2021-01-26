
import 'package:fappetite/domain/entities/client_entity.dart';

abstract class ClientOrderPresenter{
  
  Stream<List> get dataStream;
  
  Stream<List<ClientEntity>> get selectedClients;
  
  Stream<String> get searchStream;
  
  Stream<String> get searchErrorStream;
  
  Stream<String> get navigateToStream;
  
  Stream<bool> get isLoadingStream;
  
  void dispose();
  
  void goToFinishOrder();
  
  Future<void> search();
  
  void newSearch(String value);

  void goBack();
  
  void toggleClient(ClientEntity entity);
  
  bool contains(ClientEntity entity);

}
import 'dart:developer';
import 'package:get/get.dart';
import 'package:fappetite/ui/pages/client_order/client_order_presenter.dart';
import 'package:meta/meta.dart';
import '../../domain/entities/entities.dart';
import 'package:fappetite/domain/usecases/usecases.dart';


import '../../domain/helpers/domain_error.dart';

class GetClientOrderPresenter extends GetxController
    implements ClientOrderPresenter {
  final Client client;

  var _searchError = RxString();
  var _search = RxString();
  var _navigateTo = RxString();
  var _dataStream = RxList([]);

  var _isLoading = false.obs;

  var _selectedClients = RxList<ClientEntity>([]);

  GetClientOrderPresenter({
    @required this.client,
  });

  @override
  Stream<bool> get isLoadingStream => _isLoading.stream.distinct();

  @override
  Stream<String> get searchErrorStream =>
      _searchError.subject.stream.distinct();

  @override
  Stream<String> get navigateToStream => _navigateTo.stream.distinct();

  @override
  Stream<String> get searchStream => _search.stream.distinct();

  @override
  Stream<List> get dataStream => _dataStream.stream.distinct();
  
  Stream<List<ClientEntity>> get selectedClients => _selectedClients.stream;

  @override
  void newSearch(String value) {
    Future.delayed(Duration(seconds: 1), () async {
      _search.value = value;
      if (_search.value.length >= 3 == true) search();
    });
  }

  @override
  Future<void> search() async {
    _searchError.value = null;
    _isLoading.value = true;
    try {
      final List<ClientEntity> clients = await client.list();
      _dataStream.assignAll(clients);
      return clients;
    } on DomainError catch (error, stack) {
      log("\n\n ############\n${error.toString()}\n${stack.toString()}############\n\n");

      _searchError.value = error.description;
    } catch (error, stack) {
      log("\n\n ############\n${error.toString()}\n${stack.toString()}############\n\n");
    } finally {
      _isLoading.value = false;
    }
  }
  
  

  void toggleClient(ClientEntity entity) {
    if (_selectedClients.contains(entity)) {
      _selectedClients.remove(entity);
    } else {
      _selectedClients.add(entity);
    }
    //log("${_selectedClients.value}");
  }

  bool contains(ClientEntity entity) => _selectedClients.contains(entity);

  @override
  void goBack() {
    _navigateTo.value = "/new_order";
    _navigateTo.value = null;
  }

  @override
  void goToFinishOrder() {
    _navigateTo.value = "/finish_order";
    _navigateTo.value = null;
  }
}

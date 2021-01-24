import 'package:fappetite/data/usecases/search_order/remote_search_order.dart';
import 'package:fappetite/domain/usecases/sell.dart';
import 'package:fappetite/ui/pages/home/home_presenter.dart';
import 'package:fappetite/ui/pages/new_order/new_order_presenter.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';
import '../../domain/entities/entities.dart';

import '../protocols/protocols.dart';

import '../../domain/helpers/domain_error.dart';
import '../../domain/usecases/search_order.dart';

class GetXNewOrderPresenter extends GetxController implements NewOrderPresenter {
  final Sell sell;

  var _searchError = RxString();
  var _search = RxString();
  var _navigateTo = RxString();
  var _dataStream = RxList([]);
  var _isLoading = false.obs;

  GetXNewOrderPresenter({
    @required this.sell,
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

  @override
  void newSearch(String value) {
    Future.delayed(Duration(seconds: 1),()async{
      _search.value = value;
      if(_search.value.length >=3 == true)  search();
    });
    
  }

  @override
  Future<void> search() async{
    _searchError.value = null;
    _isLoading.value = true;
    try {
      final List<ProductEntity> orders =
          await sell.listProduct(ProductParams(product: _search.value, observation: null, flavor: null, client: null));
      _dataStream.assignAll(orders);
      return orders;
    } on DomainError catch (error) {
      _searchError.value = error.description;
    } finally {
      _isLoading.value = false;
    }
  }
}

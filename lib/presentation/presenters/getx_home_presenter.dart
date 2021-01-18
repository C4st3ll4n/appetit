import 'package:fappetite/data/usecases/search_order/remote_search_order.dart';
import 'package:fappetite/ui/pages/home/home_presenter.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';
import '../../domain/entities/entities.dart';

import '../protocols/protocols.dart';

import '../../domain/helpers/domain_error.dart';
import '../../domain/usecases/search_order.dart';


class GetXHomePresenter extends GetxController implements HomePresenter {
  final Validation validation;
  final SearchOrder searchOrder;
  
  var _searchError = RxString();
  var _search = RxString();
  var _navigateTo = RxString();

  var _isLoading = false.obs;


  GetXHomePresenter(
      {@required this.validation, @required this.searchOrder,});

  @override
  Stream<bool> get isLoadingStream => _isLoading.stream.distinct();

  @override
  Stream<String> get searchErrorStream => _searchError.stream.distinct();

  @override
  Stream<String> get navigateToStream => _navigateTo.stream.distinct();

  @override
  Stream<String> get searchStream => _search.stream.distinct();


  @override
  Future<List<OrderEntity>> search() async {
    _isLoading.value = true;
    try{
      final List<OrderEntity> orders = await searchOrder.search(SearchParams( _search.value));
      return orders;
      
    } on DomainError catch (error){
      _searchError.value = error.description;
    }

    _isLoading.value = false;
  }


}

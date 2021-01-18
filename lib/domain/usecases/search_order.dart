import 'package:equatable/equatable.dart';
import '../entities/order_entity.dart';

class SearchParams extends Equatable{
  SearchParams(this.search);
  
	final String search;

  @override
  List<Object> get props => [search];

}

abstract class SearchOrder{
	Future<List<OrderEntity>> search(SearchParams params);
}

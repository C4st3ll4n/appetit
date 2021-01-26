import 'package:fappetite/domain/entities/entities.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

abstract class FinishOrder{
	Future<bool> finish(FinishParams params);
}


class FinishParams {
	final bool isPaid;
	final String date;
	
	FinishParams({this.isPaid, this.date});
	
}

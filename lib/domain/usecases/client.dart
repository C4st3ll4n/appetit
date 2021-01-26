import 'package:fappetite/domain/entities/entities.dart';

abstract class Client {
	Future<List<ClientEntity>> list();
}
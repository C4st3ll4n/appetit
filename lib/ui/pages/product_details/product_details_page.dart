import 'package:fappetite/domain/entities/entities.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetailsPage extends StatelessWidget {
	ProductEntity _product;
  @override
  Widget build(BuildContext context) {
  	_product = ProductEntity.fromJson(Get.arguments);
    return Container();
  }
}

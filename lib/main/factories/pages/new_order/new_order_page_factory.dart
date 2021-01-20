import 'package:fappetite/ui/pages/new_order/new_order_page.dart';
import 'package:flutter/material.dart';
import 'new_order_presenter_factory.dart';

Widget makeNewOrderPage() => NewOrderPage(presenter: makeGetXNewOrderPresenter(),);

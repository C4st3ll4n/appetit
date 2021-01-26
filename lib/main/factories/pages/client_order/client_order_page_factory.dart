import 'package:flutter/material.dart';
import 'client_order_presenter_factory.dart';
import '../../../../ui/pages/client_order/client_order_page.dart';

Widget makeNewOrderPage() => ClientOrderPage(presenter: makeGetXClientOrderPresenter(),);

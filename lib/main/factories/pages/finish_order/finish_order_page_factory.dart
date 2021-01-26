import 'package:fappetite/main/factories/pages/finish_order/finish_order_presenter_factory.dart';
import 'package:fappetite/ui/pages/finish_order/finish_order_page.dart';
import 'package:flutter/material.dart';

Widget makeFinishOrderPage() => FinishOrderPage(presenter: makeGetXFinishOrderPresenter(),);

import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:provider/provider.dart';
import 'components/list_orders.dart';
import 'components/new_order.dart';
import 'components/welcome_text.dart';
import 'components/search_field.dart';
import 'home_presenter.dart';
import '../../components/components.dart';

class HomePage extends StatelessWidget {
  final HomePresenter presenter;

  HomePage({this.presenter});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Builder(
          builder: (BuildContext contexto) {
            
            presenter.search();
            
            presenter.isLoadingStream.listen(
              (isLoading) {
                if (isLoading) {
                  showSimpleLoading(contexto);
                } else {
                  hideLoading(contexto);
                }
              },
            );
            presenter.searchErrorStream.listen((error) {
              if (error != null && error.trim().isNotEmpty) {
                showErrorMessage(contexto, error);
              }
            });
            presenter.navigateToStream.listen((page) {
              if (page != null && page.trim().isNotEmpty) {
                Get.offAllNamed(page);
              }
            });

            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 80,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                  child: WelcomeText(
                    name: faker.person.firstName(),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 18),
                    child: NewOrder()),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 18),
                  child: Provider(
                    create: (BuildContext context) => presenter,
                    child: SearchInput(),
                  ),
                ),
                Expanded(
                  child: Provider(
                    create: (ctx) => presenter,
                    child: ListOrders(),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

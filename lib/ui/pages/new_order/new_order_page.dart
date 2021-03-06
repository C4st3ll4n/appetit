import 'dart:developer';

import 'package:fappetite/presentation/presenters/getx_new_order_presenter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../components/components.dart';
import 'components/components.dart';

class NewOrderPage extends StatelessWidget {
  final GetXNewOrderPresenter presenter;

  const NewOrderPage({Key key, this.presenter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Provider(
          create: (BuildContext context) => presenter,
          child: NewOrderBottomBar()),
      /*Builder(
        builder: (_) {
          Widget widget  = Container(width: 0,height: 0,);
          presenter.showBottomBar.listen(
            (should) {
              print("should: $should");
              if (should) {
                widget = Provider(
                    create: (BuildContext context) => presenter,
                    child: NewOrderBottomBar());
              } else {
                widget = Container(width: 0,height: 0,);
              }
            },
          );
          return widget;
        },
      ),*/
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Get.back();
            presenter.goToHome();
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Theme.of(context).primaryColor,
          ),
        ),
      ),
      body: Builder(
        builder: (contexto) {
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
              hideLoading(contexto);
            }
          });
          presenter.navigateToStream.listen((page) {
            if (page != null && page.trim().isNotEmpty) {
            log("#$page");
            Get.offAllNamed(page);
            }
          });

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                  child: HeadText(text: "Informações para o pedido"),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Text(
                    "Preencha as informações abaixo para concluir o pedido",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                        letterSpacing: 1.4),
                  ),
                ),
                Flexible(
                  flex: 20,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: OrderProgress(),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  child: Provider(
                    create: (BuildContext context) => presenter,
                    child: SearchInput(),
                  ),
                ),
                Expanded(
                  flex: MediaQuery.of(context).size.height > 500 ? 60 : 20,
                  child: Provider(
                    create: (ctx) => presenter,
                    child: ProductList(),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

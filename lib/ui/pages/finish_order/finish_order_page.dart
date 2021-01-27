import 'package:date_time_picker/date_time_picker.dart';
import 'package:fappetite/ui/pages/client_order/client_order_presenter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../components/components.dart';
import 'components/components.dart';
import 'finish_order_presenter.dart';

class FinishOrderPage extends StatelessWidget {
  final FinishOrderPresenter presenter;

  const FinishOrderPage({Key key, this.presenter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Theme.of(context).primaryColor,
          ),
        ),
      ),
      body: Builder(
        builder: (contexto) {
          presenter.isLoadingStream.listen(
            (isLoading) {
              if (isLoading) {
                showSimpleLoading(contexto);
              } else {
                hideLoading(contexto);
              }
            },
          );
          presenter.mainErrorStream.listen((error) {
            if (error != null && error.trim().isNotEmpty) {
              showErrorMessage(contexto, error);
              hideLoading(contexto);
            }
          });
          presenter.navigateToStream.listen((page) {
            if (page != null && page.trim().isNotEmpty) {
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
                  flex: 10,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: OrderProgress(),
                  ),
                ),
                Provider(
                    create: (BuildContext context) => presenter,
                    child: PaymentCheckbox()),
                Provider(
                  create: (BuildContext context) => presenter,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: DatePicker()
                  ),
                ),
                SizedBox(height: 30,),
                Provider(create: (BuildContext context) => presenter,
                child: FinishButton())
              ],
            ),
          );
        },
      ),
    );
  }
}

import 'package:fappetite/presentation/presenters/getx_new_order_presenter.dart';

import '../../home/home_presenter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../new_order_presenter.dart';

class SearchInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final GetXNewOrderPresenter presenter = Provider.of<GetXNewOrderPresenter>(context);
    final border = UnderlineInputBorder();
    return StreamBuilder<String>(
      stream: presenter.searchStream,
      builder: (ctx, snap) => TextFormField(
        onChanged: presenter.newSearch,
        decoration: InputDecoration(
          border: border,
          errorBorder: border,
          focusedErrorBorder: border,
          disabledBorder: border,
          focusedBorder: border,
          enabledBorder: border,
          hintText: "Digite a sua busca aqui",
          hintMaxLines: 1,
          hintStyle: TextStyle(fontSize: 18),
          prefixIcon: Icon(
            Icons.search,
            size: 28,
            color: Theme.of(context).primaryColorLight,
          ),
        ),
        keyboardType: TextInputType.text,
      ),
    );
  }
}

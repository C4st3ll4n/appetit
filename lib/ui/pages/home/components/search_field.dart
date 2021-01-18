import '../../home/home_presenter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchInput extends StatelessWidget {
	
	@override
	Widget build(BuildContext context) {
		final presenter = Provider.of<HomePresenter>(context);
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
					errorText:
					snap.data?.isEmpty == true ? null : snap.data,
					hintText: "Digite a sua busca aqui",
					
					hintMaxLines: 1,
					hintStyle: TextStyle(fontSize: 18),
					prefixIcon: Icon(
						Icons.search,size: 28,
						color: Theme.of(context).primaryColorLight,
					),
				),
				keyboardType: TextInputType.text,
			),
		);
	}
}
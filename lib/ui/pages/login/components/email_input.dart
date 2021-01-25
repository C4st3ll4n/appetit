import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../login_presenter.dart';

class EmailInput extends StatelessWidget {
	
	@override
	Widget build(BuildContext context) {
		final presenter = Provider.of<LoginPresenter>(context);
		return StreamBuilder<String>(
			stream: presenter.emailErrorStream,
			builder: (ctx, snap) => TextFormField(
				onChanged: presenter.validateEmail,
				decoration: InputDecoration(
					hintText: "Insira seu e-mail aqui",
					errorText:
					snap.data?.isEmpty == true ? null : snap.data,
					labelText: "Email",
				),
				keyboardType: TextInputType.emailAddress,
			),
		);
	}
}
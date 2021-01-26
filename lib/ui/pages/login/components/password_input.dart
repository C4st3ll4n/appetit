
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../login_presenter.dart';

class PasswordInput extends StatelessWidget {
	const PasswordInput({
		Key key,
	}) : super(key: key);
	
	@override
	Widget build(BuildContext context) {
		final presenter = Provider.of<LoginPresenter>(context);
		return StreamBuilder<String>(
			stream: presenter.passwordErrorStream,
			builder: (ctx, snap) => TextFormField(
				onChanged: presenter.validatePassword,
				decoration: InputDecoration(
					floatingLabelBehavior: FloatingLabelBehavior.always,
					suffixIcon: IconButton(onPressed: () {  }, icon: Icon(Icons.visibility_off_outlined),),
					hintText: "Insira a sua senha aqui",
					labelText: "Senha",
					errorText: snap.data?.isEmpty == true
							? null
							: snap.data,
				),
				keyboardType: TextInputType.visiblePassword,
				obscureText: true,
			),
		);
	}
}

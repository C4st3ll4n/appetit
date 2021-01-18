
import 'package:flutter/material.dart';

class Headline2 extends StatelessWidget {
	final String text;
	
	const Headline2({
		Key key,
		@required this.text
	}) : super(key: key);
	
	@override
	Widget build(BuildContext context) {
		return Text(
			"$text",
			textAlign: TextAlign.center,
			style: Theme.of(context).textTheme.headline2.copyWith(color: Theme.of(context).primaryColorLight, fontSize: 36),
		);
	}
}

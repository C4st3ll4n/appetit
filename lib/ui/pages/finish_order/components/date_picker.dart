import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../finish_order_presenter.dart';

class DatePicker extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		final presenter = Provider.of<FinishOrderPresenter>(context);
		return DateTimePicker(
			type: DateTimePickerType.date,
			dateMask: 'd/MM/yyyy',
			//initialValue: DateTime.now().toString(),
			firstDate: DateTime(2000),
			lastDate: DateTime(2022),
			confirmText: "Confirmar",
			cursorColor: Theme.of(context).primaryColor,
			decoration: InputDecoration(
				prefixIcon: Icon(Icons.event),
				labelText: "Data",
				hintText: "Escolha uma data",
			),
			dateLabelText: 'Data',
			//locale: Locale("pt","BR"),
			timeLabelText: "Hora",
			selectableDayPredicate: (date) {
				// Disable weekend days to select from the calendar
				if (date.weekday == 6 || date.weekday == 7) {
					return false;
				}
				return true;
			},
			onChanged: presenter.setDate,
			/*validator: (val) {
				print(val);
				return null;
			},*/
			onSaved:presenter.setDate,
		);
	}
}

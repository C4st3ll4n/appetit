import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:fappetite/validation/protocols/field_validate.dart';

class MinLengthFieldValidation extends Equatable implements FieldValidation {
	MinLengthFieldValidation({ @required this.field, @required this.minLength});
	
	final String field;
	final int minLength;
	
	@override
	List<Object> get props => [field];
	
	@override
	String validate(String value) {
		if (value != null && value.trim().isNotEmpty && value.length >= minLength) return null;
		return "Campo muito curto";
	}
}

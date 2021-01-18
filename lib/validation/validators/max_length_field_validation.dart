import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:fappetite/validation/protocols/field_validate.dart';

class MaxLengthFieldValidation extends Equatable implements FieldValidation {
	MaxLengthFieldValidation({ @required this.field, @required this.maxLength});
	
	final String field;
	final int maxLength;
	
	@override
	List<Object> get props => [field];
	
	@override
	String validate(String value) {
		if (value != null && value.trim().isNotEmpty && value.length >= maxLength) return null;
		return "Campo muito grande";
	}
}

import 'package:flutter_test/flutter_test.dart';
import 'package:fappetite/main/factories/factories.dart';
import 'package:fappetite/validation/validators/validators.dart';




void main(){
	
	
	test("Should return the correct validations",(){
		final validations = makeLoginValidations();
		expect(validations, [
			RequiredFieldValidation("email"),
			EmailValidation("email"),
			RequiredFieldValidation("password"),]);
	});
}
import '../../../builders/builders.dart';

import '../../../../validation/protocols/field_validate.dart';
import '../../../../presentation/protocols/protocols.dart';
import '../../../../validation/validators/validators.dart';

Validation makeLoginValidation() => ValidationComposite(makeLoginValidations());

List<FieldValidation> makeLoginValidations() {
  return [
    ...ValidationBuilder.field("email").required().email().build(),
    ...ValidationBuilder.field("password").required().minLength(3).build(),
  ];
}

import '../../../builders/builders.dart';

import '../../../../validation/protocols/field_validate.dart';
import '../../../../presentation/protocols/protocols.dart';
import '../../../../validation/validators/validators.dart';

Validation makeSearchValidation()
=> ValidationComposite(makeSearchValidations());

List<FieldValidation> makeSearchValidations() {
  return [
    ...ValidationBuilder.field("search").required().minLength(3).build(),
  ];
}

import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:fappetite/domain/entities/account_entity.dart';
import 'package:fappetite/domain/helpers/domain_error.dart';
import 'package:fappetite/domain/usecases/authentication.dart';
import 'package:fappetite/domain/usecases/usecases.dart';

import 'package:fappetite/presentation/presenters/presenters.dart';
import 'package:fappetite/presentation/protocols/protocols.dart';

class ValidationSpy extends Mock implements Validation {}

class AuthenticationSpy extends Mock implements Authentication {}


void main() {
  String email;
  String token;
  String password;
  Validation validation;
  Authentication authentication;
  GetXLoginPresenter sut;

  PostExpectation mockValidationCall(String field) => when(
        validation.validate(
          field: field != null ? field : anyNamed("field"),
          value: anyNamed("value"),
        ),
      );

  void mockValidation({String field, String value}) =>
      mockValidationCall(field).thenReturn(value);

  PostExpectation mockAuthenticationCall() => when(
        authentication.auth(
          any,
        ),
      );

  void mockAuthentication() =>
      mockAuthenticationCall().thenAnswer((_) async => AccountEntity(token));

  void mockAuthenticationError(DomainError error) =>
      mockAuthenticationCall().thenThrow(error);

  void mockSaveCurrentAccountError(DomainError error) =>
      mockAuthenticationCall().thenThrow(error ?? DomainError.unexpected);

  setUp(
    () {
      token = faker.guid.guid();
      validation = ValidationSpy();
      authentication = AuthenticationSpy();

      sut = GetXLoginPresenter(
          validation: validation,
          authentication: authentication,
      );

      email = faker.internet.email();
      password = faker.internet.password();

      mockValidation();
      mockAuthentication();
    },
  );

  test(
    "Should call validation with correct e-mail",
    () {
      sut.validateEmail(email);

      verify(validation.validate(field: "email", value: email)).called(1);
    },
  );

  test(
    "Should emit email error if validation fails",
    () {
      //mockValidationCall().thenReturn("error");
      mockValidation(value: "error");

      sut.emailErrorStream.listen(
        expectAsync1(
          (error) => expect(error, "error"),
        ),
      );

      sut.isFormValidStream.listen(
        expectAsync1(
          (isValid) => expect(isValid, false),
        ),
      );

      sut.validateEmail(email);
      sut.validateEmail(email);
    },
  );

  test(
    "Should emit null if validation succeeds",
    () {
      sut.emailErrorStream.listen(
        expectAsync1(
          (error) => expect(error, null),
        ),
      );

      sut.isFormValidStream.listen(
        expectAsync1(
          (isValid) => expect(isValid, false),
        ),
      );

      sut.validateEmail(email);
      sut.validateEmail(email);
    },
  );

  /* PASSWORD VALIDATION */

  test(
    "Should call validation with correct password",
    () {
      sut.validatePassword(password);

      verify(validation.validate(field: "password", value: password)).called(1);
    },
  );

  test(
    "Should emit password error if validation fails",
    () {
      //mockValidationCall().thenReturn("error");
      mockValidation(value: "error");

      sut.passwordErrorStream.listen(
        expectAsync1(
          (error) => expect(error, "error"),
        ),
      );

      sut.isFormValidStream.listen(
        expectAsync1(
          (isValid) => expect(isValid, false),
        ),
      );

      sut.validatePassword(password);
      sut.validatePassword(password);
    },
  );

  test(
    "Should emit null if password validation succeeds",
    () {
      sut.passwordErrorStream.listen(
        expectAsync1(
          (error) => expect(error, null),
        ),
      );

      sut.isFormValidStream.listen(
        expectAsync1(
          (isValid) => expect(isValid, false),
        ),
      );

      sut.validatePassword(password);
      sut.validatePassword(password);
    },
  );

  /* FORM TESTS */

  test(
    "Should emit email error if validation fails",
    () {
      //mockValidationCall().thenReturn("error");
      mockValidation(value: "error", field: "email");

      sut.emailErrorStream.listen(
        expectAsync1(
          (error) => expect(error, "error"),
        ),
      );

      sut.passwordErrorStream.listen(
        expectAsync1(
          (error) => expect(error, null),
        ),
      );

      sut.isFormValidStream.listen(
        expectAsync1(
          (isValid) => expect(isValid, false),
        ),
      );

      sut.validateEmail(email);
      sut.validatePassword(password);
    },
  );

  test(
    "Should emit success if validation is okay",
    () async {
      sut.emailErrorStream.listen(
        expectAsync1(
          (error) => expect(error, null),
        ),
      );

      sut.passwordErrorStream.listen(
        expectAsync1(
          (error) => expect(error, null),
        ),
      );
      expectLater(
        sut.isFormValidStream,
        emitsInOrder(
          [false, true],
        ),
      );

      sut.validateEmail(email);
      await Future.delayed(Duration.zero);
      sut.validatePassword(password);
    },
  );

  test(
    "Should call authentication with correct values",
    () async {
      sut.validateEmail(email);
      sut.validatePassword(password);

      await sut.auth();

      verify(
        authentication.auth(
          AuthenticationParams(email: email, secret: password),
        ),
      ).called(1);
    },
  );
  test(
    "Should emit correct event on Authentication success",
    () async {
      sut.validateEmail(email);
      sut.validatePassword(password);

      expectLater(
        sut.isLoadingStream,
        emits(
          true,
        ),
      );

      await sut.auth();
    },
  );

  test(
    "Should emit correct event on Authentication invalid credentials error",
    () async {
      mockAuthenticationError(DomainError.invalidCredentials);

      sut.validateEmail(email);
      sut.validatePassword(password);

      expectLater(
        sut.isLoadingStream,
        emitsInOrder(
          [!false, !true],
        ),
      );

      sut.mainErrorStream.listen(
        expectAsync1(
          (error) => expect(error, DomainError.invalidCredentials.description),
        ),
      );

      await sut.auth();
    },
  );

  test(
    "Should emit correct event on Authentication unexpected error",
    () async {
      mockAuthenticationError(DomainError.unexpected);

      sut.validateEmail(email);
      sut.validatePassword(password);

      expectLater(
        sut.isLoadingStream,
        emitsInOrder(
          [!false, !true],
        ),
      );

      sut.mainErrorStream.listen(
        expectAsync1(
          (error) => expect(error, DomainError.unexpected.description),
        ),
      );

      await sut.auth();
    },
  );

  test(
    "Should change page on success",
    () async {
      sut.validateEmail(email);
      sut.validatePassword(password);

      sut.navigateToStream.listen(
        expectAsync1(
          (page) => expect(page, "/orders"),
        ),
      );

      await sut.auth();
    },
  );
}

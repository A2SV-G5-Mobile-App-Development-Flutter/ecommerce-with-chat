// Mocks generated by Mockito 5.4.4 from annotations
// in ecommerce/test/features/auth/usecases/get_current_user_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:dartz/dartz.dart' as _i2;
import 'package:ecommerce/core/error/failure.dart' as _i5;
import 'package:ecommerce/features/auth/domain/entities/authenticated_user.dart'
    as _i6;
import 'package:ecommerce/features/auth/domain/repositories/auth_repository.dart'
    as _i3;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeEither_0<L, R> extends _i1.SmartFake implements _i2.Either<L, R> {
  _FakeEither_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [AuthRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockAuthRepository extends _i1.Mock implements _i3.AuthRepository {
  MockAuthRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.Either<_i5.Failure, _i6.AuthenticatedUser>> login({
    required String? email,
    required String? password,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #login,
          [],
          {
            #email: email,
            #password: password,
          },
        ),
        returnValue:
            _i4.Future<_i2.Either<_i5.Failure, _i6.AuthenticatedUser>>.value(
                _FakeEither_0<_i5.Failure, _i6.AuthenticatedUser>(
          this,
          Invocation.method(
            #login,
            [],
            {
              #email: email,
              #password: password,
            },
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, _i6.AuthenticatedUser>>);

  @override
  _i4.Future<_i2.Either<_i5.Failure, _i6.AuthenticatedUser>> register({
    required String? name,
    required String? email,
    required String? password,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #register,
          [],
          {
            #name: name,
            #email: email,
            #password: password,
          },
        ),
        returnValue:
            _i4.Future<_i2.Either<_i5.Failure, _i6.AuthenticatedUser>>.value(
                _FakeEither_0<_i5.Failure, _i6.AuthenticatedUser>(
          this,
          Invocation.method(
            #register,
            [],
            {
              #name: name,
              #email: email,
              #password: password,
            },
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, _i6.AuthenticatedUser>>);

  @override
  _i4.Future<_i2.Either<_i5.Failure, _i2.Unit>> logout() => (super.noSuchMethod(
        Invocation.method(
          #logout,
          [],
        ),
        returnValue: _i4.Future<_i2.Either<_i5.Failure, _i2.Unit>>.value(
            _FakeEither_0<_i5.Failure, _i2.Unit>(
          this,
          Invocation.method(
            #logout,
            [],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, _i2.Unit>>);

  @override
  _i4.Future<_i2.Either<_i5.Failure, _i6.AuthenticatedUser>> getCurrentUser() =>
      (super.noSuchMethod(
        Invocation.method(
          #getCurrentUser,
          [],
        ),
        returnValue:
            _i4.Future<_i2.Either<_i5.Failure, _i6.AuthenticatedUser>>.value(
                _FakeEither_0<_i5.Failure, _i6.AuthenticatedUser>(
          this,
          Invocation.method(
            #getCurrentUser,
            [],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, _i6.AuthenticatedUser>>);
}
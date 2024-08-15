import '../../domain/entities/authenticated_user.dart';

class AuthenticatedUserModel extends AuthenticatedUser {
  const AuthenticatedUserModel({
    required super.id,
    required super.email,
    required super.name,
    required super.accessToken,
  });

  factory AuthenticatedUserModel.fromJson(Map<String, dynamic> json) {
    return AuthenticatedUserModel(
      id: json['id'],
      email: json['email'],
      name: json['name'],
      accessToken: json['access_token'],
    );
  }
}

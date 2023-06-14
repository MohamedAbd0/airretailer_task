import 'package:airretailer_task/features/authentication/domain/entities/auth_user.dart';

class AuthUserModel extends AuthUser {
  const AuthUserModel({
    required super.name,
    required super.email,
    required super.id,
    required super.gender,
  });
}

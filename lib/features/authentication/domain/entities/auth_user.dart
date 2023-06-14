import 'package:equatable/equatable.dart';

class AuthUser extends Equatable {
  final String id;
  final String name;
  final String email;
  final String gender;

  const AuthUser(
      {required this.id,
      required this.name,
      required this.email,
      required this.gender});

  @override
  List<Object?> get props => [
        id,
        name,
        email,
        gender,
      ];
}

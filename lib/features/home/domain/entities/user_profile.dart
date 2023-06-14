import 'package:equatable/equatable.dart';

class UserProfile extends Equatable implements Comparable<UserProfile> {
  final String name;
  final String email;
  final String photoUrl;
  final String phoneNumber;
  final String address;
  final bool online;

  const UserProfile({
    required this.name,
    required this.email,
    required this.photoUrl,
    required this.phoneNumber,
    required this.address,
    required this.online,
  });

  @override
  List<Object?> get props => [
        name,
        email,
        photoUrl,
        phoneNumber,
        address,
        online,
      ];

  @override
  int compareTo(UserProfile other) {
    return name.compareTo(other.name);
  }
}

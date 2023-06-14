import 'package:airretailer_task/features/home/domain/entities/user_profile.dart';

class UserProfileModel extends UserProfile {
  const UserProfileModel({
    required super.name,
    required super.email,
    required super.photoUrl,
    required super.phoneNumber,
    required super.address,
    required super.online,
  });

  factory UserProfileModel.fromJson(Map<String, dynamic> json) {
    return UserProfileModel(
      name: json['name'],
      email: json['email'],
      photoUrl: json['photoUrl'],
      phoneNumber: json['phoneNumber'],
      address: json['address'],
      online: json['online'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'photoUrl': photoUrl,
      'phoneNumber': phoneNumber,
      'address': address,
      'online': online,
    };
  }
}

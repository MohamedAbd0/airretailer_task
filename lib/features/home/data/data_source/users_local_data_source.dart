import 'dart:convert';
import 'package:airretailer_task/features/home/data/model/user_profile_model.dart';
import 'package:flutter/services.dart';

abstract class BaseUsersLocalDataSource {
  Future<List<UserProfileModel>> getUsers();
}

class UsersLocalDataSource extends BaseUsersLocalDataSource {
  @override
  Future<List<UserProfileModel>> getUsers() async {
    List<UserProfileModel> users = [];

    final jsonString = await rootBundle.loadString('assets/users.json');
    final jsonData = jsonDecode(jsonString)['users'];
    jsonData.forEach((element) {
      users.add(UserProfileModel.fromJson(element));
    });

    return users;
  }
}

import 'package:airretailer_task/features/home/domain/usecases/get_users.dart';
import 'package:flutter/material.dart';
import '../../domain/entities/user_profile.dart';

class UsersController extends ChangeNotifier {
  final GetUsersProfileUseCase getUsersProfileUseCase;
  UsersController(this.getUsersProfileUseCase);

  List<UserProfile> _users = [];
  List<UserProfile> get users => _users;

  List<UserProfile> _filteredUsers = [];
  List<UserProfile> get filteredUsers => _filteredUsers;

  Future<void> getUsers() async {
    final result = await getUsersProfileUseCase();
    result.fold((failure) {}, (users) {
      users.sort();
      _users = users;
      _filteredUsers = users;
      notifyListeners();
    });
  }

  void filterUsers(String query) {
    _filteredUsers = _users
        .where((user) => user.name.toLowerCase().contains(query.toLowerCase()))
        .toList();
    notifyListeners();
  }
}

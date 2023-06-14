import 'package:airretailer_task/core/constants/size.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../core/services/services_locator.dart';
import '../../../../../src/shard/widget/search_inputField.dart';
import '../../provider/users.dart';
import '../widget/custom_appbar.dart';
import '../widget/personal_card.dart';

class HomeScreen extends StatelessWidget {
  static const name = '/home';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const CustomAppBar(),
        body: ChangeNotifierProvider<UsersController>(
          create: (_) => sl<UsersController>()..getUsers(),
          child: Consumer<UsersController>(
            builder: (context, model, child) {
              return Column(
                children: [
                  //search
                  SearchInputField(
                    onChanged: (value) {
                      model.filterUsers(value);
                    },
                  ),

                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(ConstantsSize.largePadding),
                      child: GridView.builder(
                          shrinkWrap: true,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 0.6,
                            mainAxisSpacing: ConstantsSize.largePadding,
                            crossAxisSpacing: ConstantsSize.largePadding,
                          ),
                          itemCount: model.filteredUsers.length,
                          itemBuilder: (BuildContext ctx, index) {
                            return PersonalCard(
                              user: model.filteredUsers[index],
                            );
                          }),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
